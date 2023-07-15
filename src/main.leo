// The 'newsletter' program.
program newsletter.aleo {

    struct Bytes64 {
        b0: u128,
        b1: u128,
        b2: u128,
        b3: u128,
    }

    struct Bytes112 {
        b0: u128,
        b1: u128,
        b2: u128,
        b3: u128,
        b4: u128,
        b5: u128,
        b6: u128,
    }

    struct SharedSecret {
        shared_secret: Bytes64,
        recipient: Bytes112,
    }

    record Newsletter {
        owner: address,
        op: address,
        id: field,
        member_sequence: u128,
        base: bool,
        revision: bool,
        title: Bytes64,
        template: Bytes64,
        content: Bytes64,
        group_secret: u128,
        individual_secret: u128,
    }

    record Subscription {
        owner: address,
        op: address,
        id: field,
        member_sequence: u128,
        member_secret_idx: field,
    }

    mapping newsletter_member_sequence: field => u128;
    mapping member_secrets: field => SharedSecret;

    function cantors_pairing(x: u128, y: u128) -> u128 {
        return (((x + y) * (x + y + 1u128)) / 2u128) + y;
    }

    // Determine fee estimates based on the following Ok amounts in rust:
    // https://github.com/AleoHQ/snarkVM/blob/e489fd283108f0ebf2558aac63f64968563d9c2a/synthesizer/src/vm/helpers/cost.rs#L24-L95
    // https://github.com/AleoHQ/snarkVM/blob/e489fd283108f0ebf2558aac63f64968563d9c2a/synthesizer/src/vm/helpers/cost.rs#L98

    transition main(title: Bytes64, template: Bytes64, content: Bytes64,  group_secret: u128, individual_secret: u128, shared_secret: Bytes64, shared_recipient: Bytes112) -> Newsletter {
        let limit: u128 = 0u128.sub_wrapped(1u128) / 2u128;
        assert(group_secret <= limit);
        assert(individual_secret <= limit);
        let idx: field = BHP256::hash_to_field(group_secret);
        let member_sequence: u128 = 1u128;
        let member_secret_idx: field = BHP256::hash_to_field(cantors_pairing(group_secret, member_sequence));

        return Newsletter {
            owner: self.caller,
            op: self.caller,
            id: idx,
            member_sequence,
            base: true,
            revision: false,
            title,
            template,
            content,
            group_secret,
            individual_secret,
        } then finalize (idx, member_sequence, member_secret_idx, shared_secret, shared_recipient);
    }

    finalize main(idx: field, member_sequence: u128, member_secret_idx: field, shared_secret: Bytes64, shared_recipient: Bytes112) {
        // 2_000 microcredits
        assert(member_sequence == 1u128);
        // 500_000 microcredits
        let is_init: u128 = Mapping::get_or_use(newsletter_member_sequence, idx, 0u128);
        // 2_000 microcredits
        assert(is_init == 0u128);
        // 1_000_000 microcredits
        Mapping::set(newsletter_member_sequence, idx, member_sequence);
        // 2_000 * 4 microcredits
        let init_bytes64: Bytes64 = Bytes64 {
            b0: 0u128,
            b1: 0u128,
            b2: 0u128,
            b3: 0u128,
        };
        // 2_000 * 7 microcredits
        let init_bytes112: Bytes112 = Bytes112 {
            b0: 0u128,
            b1: 0u128,
            b2: 0u128,
            b3: 0u128,
            b4: 0u128,
            b5: 0u128,
            b6: 0u128,
        };
        // 2_000 microcredits
        assert(shared_secret != init_bytes64);
        // 2_000 microcredits
        assert(shared_recipient != init_bytes112);
        // 2_000 * 2 microcredits
        let init_shared_secret: SharedSecret = SharedSecret {
            shared_secret: init_bytes64,
            recipient: init_bytes112,
        };
        // 500_000 microcredits
        let is_init_secret: SharedSecret = Mapping::get_or_use(member_secrets, member_secret_idx, init_shared_secret);
        // 2_000 microcredits
        assert(is_init_secret.shared_secret == init_bytes64);
        // 2_000 microcredits
        assert(is_init_secret.recipient == init_bytes112);
        // 1_000_000 + 2_000 * 2 microcredits
        Mapping::set(member_secrets, member_secret_idx, SharedSecret {
            shared_secret: shared_secret,
            recipient: shared_recipient,
        });
    }
    // Sum of all above microcredits in finalize main: 3_038_000

    transition invite(newsletter: Newsletter, recipient: address) -> (Newsletter, Newsletter) {
        assert(newsletter.owner == self.caller);
        assert(newsletter.op == self.caller);

        let member_id: u128 = newsletter.member_sequence + 1u128;

        return (Newsletter {
            owner: self.caller,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: member_id,
            base: true,
            revision: false,
            title: newsletter.title,
            template: newsletter.template, 
            content: newsletter.content,
            group_secret: newsletter.group_secret,
            individual_secret: newsletter.individual_secret,
        }, Newsletter {
            owner: recipient,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: member_id,
            base: true,
            revision: false,
            title: newsletter.title,
            template: newsletter.template,
            content: newsletter.content,
            group_secret: newsletter.group_secret,
            individual_secret: 0u128,
        }) then finalize (newsletter.id, member_id);
    }

    finalize invite(idx: field, member_sequence: u128) {
        let is_init: u128 = Mapping::get_or_use(newsletter_member_sequence, idx, 0u128);
        assert(is_init != 0u128);
        Mapping::set(newsletter_member_sequence, idx, member_sequence);
    }

    transition accept(newsletter: Newsletter, secret: u128, shared_secret: Bytes64, shared_recipient: Bytes112) -> (Newsletter, Subscription, Subscription) {
        assert(self.caller == newsletter.owner);
        assert(self.caller != newsletter.op);
        assert(newsletter.base == true);
        assert(newsletter.revision == false);

        let member_secret_idx: field = BHP256::hash_to_field(cantors_pairing(newsletter.group_secret, newsletter.member_sequence));

        return (Newsletter {
            owner: self.caller,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: newsletter.member_sequence,
            base: true,
            revision: false,
            title: newsletter.title,
            template: newsletter.template,
            content: newsletter.content,
            group_secret: newsletter.group_secret,
            individual_secret: secret,
        }, Subscription {
            owner: self.caller,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: newsletter.member_sequence,
            member_secret_idx: member_secret_idx,
        }, Subscription {
            owner: newsletter.op,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: newsletter.member_sequence,
            member_secret_idx: member_secret_idx,
        }) then finalize (member_secret_idx, shared_secret, shared_recipient);
    }

    finalize accept(member_secret_idx: field, shared_secret: Bytes64, shared_recipient: Bytes112) {
        let init_bytes64: Bytes64 = Bytes64 {
            b0: 0u128,
            b1: 0u128,
            b2: 0u128,
            b3: 0u128,
        };
        let init_bytes112: Bytes112 = Bytes112 {
            b0: 0u128,
            b1: 0u128,
            b2: 0u128,
            b3: 0u128,
            b4: 0u128,
            b5: 0u128,
            b6: 0u128,
        };
        assert(shared_secret != init_bytes64);
        assert(shared_recipient != init_bytes112);
        let init_shared_secret: SharedSecret = SharedSecret {
            shared_secret: init_bytes64,
            recipient: init_bytes112,
        };
        let is_init: SharedSecret = Mapping::get_or_use(member_secrets, member_secret_idx, init_shared_secret);
        assert(is_init.shared_secret == init_bytes64);
        assert(is_init.recipient == init_bytes112);
        Mapping::set(member_secrets, member_secret_idx, SharedSecret {
            shared_secret: shared_secret,
            recipient: shared_recipient,
        });
    }

    transition deliver(newsletter: Newsletter, title: Bytes64, content: Bytes64, recipient: address) -> (Newsletter, Newsletter) {
        assert(newsletter.owner == self.caller);
        assert(newsletter.base == true);
        assert(newsletter.revision == false);

        return (Newsletter {
            owner: self.caller,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: newsletter.member_sequence,
            base: newsletter.base,
            revision: newsletter.revision,
            title: newsletter.title,
            template: newsletter.template,
            content: newsletter.content,
            group_secret: newsletter.group_secret,
            individual_secret: newsletter.individual_secret,
        }, Newsletter {
            owner: recipient,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: newsletter.member_sequence,
            base: false,
            revision: true,
            title,
            template: newsletter.template,
            content,
            group_secret: newsletter.group_secret,
            individual_secret: 0u128,
        });
    }

    transition unsub(subscription: Subscription) -> bool {
        assert(subscription.owner == self.caller || subscription.op == self.caller);

        let member_secret_idx: field = subscription.member_secret_idx;
        return subscription.owner == self.caller then finalize (member_secret_idx);
    }

    finalize unsub(member_secret_idx: field) {
        let init_bytes64: Bytes64 = Bytes64 {
            b0: 0u128,
            b1: 0u128,
            b2: 0u128,
            b3: 0u128,
        };
        let init_bytes112: Bytes112 = Bytes112 {
            b0: 0u128,
            b1: 0u128,
            b2: 0u128,
            b3: 0u128,
            b4: 0u128,
            b5: 0u128,
            b6: 0u128,
        };
        let init_shared_secret: SharedSecret = SharedSecret {
            shared_secret: init_bytes64,
            recipient: init_bytes112,
        };
        let is_init: SharedSecret = Mapping::get_or_use(member_secrets, member_secret_idx, init_shared_secret);
        assert(is_init.shared_secret != init_bytes64);
        assert(is_init.recipient != init_bytes112);
        Mapping::set(member_secrets, member_secret_idx, SharedSecret {
            shared_secret: init_bytes64,
            recipient: init_bytes112,
        });
    }
}
