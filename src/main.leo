// The 'newsletter' program.
program newsletter.aleo {

    // The 'Newsletter' struct.
    struct SharedSecret {
        shared_secret: u64,
        recipient: u128,
    }

    record Newsletter {
        owner: address,
        op: address,
        id: field,
        member_sequence: u64,
        base: bool,
        revision: bool,
        title: u128,
        template: u128,
        content: u128,
        group_secret: u64,
        individual_secret: u64,
    }

    mapping newsletter_member_sequence: field => u64;
    mapping member_secrets: field => SharedSecret;

    function cantors_pairing(x: u64, y: u64) -> u64 {
        return (((x + y) * (x + y + 1u64)) / 2u64) + y;
    }

    transition main(title: u128, template: u128, content: u128,  group_secret: u64, individual_secret: u64, shared_secret: u64, shared_recipient: u128) -> Newsletter {
        let idx: field = BHP256::hash_to_field(group_secret);
        let member_sequence: u64 = 1u64;
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

    finalize main(idx: field, member_sequence: u64, member_secret_idx: field, shared_secret: u64, shared_recipient: u128) {
        assert(member_sequence == 1u64);
        let is_init: u64 = Mapping::get_or_use(newsletter_member_sequence, idx, 0u64);
        assert(is_init == 0u64);
        Mapping::set(newsletter_member_sequence, idx, member_sequence);
        assert(shared_secret != 0u64);
        assert(shared_recipient != 0u128);
        let init_shared_secret: SharedSecret = SharedSecret {
            shared_secret: 0u64,
            recipient: 0u128,
        };
        let is_init_secret: SharedSecret = Mapping::get_or_use(member_secrets, member_secret_idx, init_shared_secret);
        assert(is_init_secret.shared_secret == 0u64);
        assert(is_init_secret.recipient == 0u128);
        Mapping::set(member_secrets, member_secret_idx, SharedSecret {
            shared_secret: shared_secret,
            recipient: shared_recipient,
        });
    }

    transition invite(newsletter: Newsletter, recipient: address) -> (Newsletter, Newsletter) {
        assert(newsletter.owner == self.caller);
        assert(newsletter.op == self.caller);

        let member_id: u64 = newsletter.member_sequence + 1u64;

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
            individual_secret: 0u64,
        }) then finalize (newsletter.id, member_id);
    }

    finalize invite(idx: field, member_sequence: u64) {
        let is_init: u64 = Mapping::get_or_use(newsletter_member_sequence, idx, 0u64);
        assert(is_init != 0u64);
        Mapping::set(newsletter_member_sequence, idx, member_sequence);
    }

    transition accept(newsletter: Newsletter, secret: u64, shared_secret: u64, shared_recipient: u128) -> Newsletter {
        assert(self.caller == newsletter.owner);
        assert(self.caller != newsletter.op);
        assert(newsletter.base == true);
        assert(newsletter.revision == false);

        let member_secret_idx: field = BHP256::hash_to_field(cantors_pairing(newsletter.group_secret, newsletter.member_sequence));

        return Newsletter {
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
        } then finalize (member_secret_idx, shared_secret, shared_recipient);
    }

    finalize accept(member_secret_idx: field, shared_secret: u64, shared_recipient: u128) {
        assert(shared_secret != 0u64);
        assert(shared_recipient != 0u128);
        let init_shared_secret: SharedSecret = SharedSecret {
            shared_secret: 0u64,
            recipient: 0u128,
        };
        let is_init: SharedSecret = Mapping::get_or_use(member_secrets, member_secret_idx, init_shared_secret);
        assert(is_init.shared_secret == 0u64);
        assert(is_init.recipient == 0u128);
        Mapping::set(member_secrets, member_secret_idx, SharedSecret {
            shared_secret: shared_secret,
            recipient: shared_recipient,
        });
    }

    transition deliver(newsletter: Newsletter, title: u128, content: u128, recipient: address) -> (Newsletter, Newsletter) {
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
            individual_secret: 0u64,
        });
    }

    transition unsub(newsletter: Newsletter) -> bool {
        assert(newsletter.owner == self.caller);
        assert(newsletter.base == true);
        assert(newsletter.revision == false);

        let member_secret_idx: field = BHP256::hash_to_field(cantors_pairing(newsletter.group_secret, newsletter.member_sequence));
        return newsletter.owner == self.caller && newsletter.op != self.caller then finalize (member_secret_idx);
    }

    finalize unsub(member_secret_idx: field) {
        let init_shared_secret: SharedSecret = SharedSecret {
            shared_secret: 0u64,
            recipient: 0u128,
        };
        let is_init: SharedSecret = Mapping::get_or_use(member_secrets, member_secret_idx, init_shared_secret);
        assert(is_init.shared_secret != 0u64);
        assert(is_init.recipient != 0u128);
        Mapping::set(member_secrets, member_secret_idx, SharedSecret {
            shared_secret: 0u64,
            recipient: 0u128,
        });
    }
}
