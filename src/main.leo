// The 'newsletter' program.
program newsletter_v0_1_0.aleo {

    struct Bytes24 {
        b0: u8,
        b1: u8,
        b2: u8,
        b3: u8,
        b4: u8,
        b5: u8,
        b6: u8,
        b7: u8,
        b8: u8,
        b9: u8,
        b10: u8,
        b11: u8,
        b12: u8,
        b13: u8,
        b14: u8,
        b15: u8,
        b16: u8,
        b17: u8,
        b18: u8,
        b19: u8,
        b20: u8,
        b21: u8,
        b22: u8,
        b23: u8,
    }

    struct Bytes64 {
        b0: u128,
        b1: u128,
        b2: u128,
        b3: u128,
    }

    struct SharedSecret {
        shared_public_key: Bytes64,
        recipient: Bytes64,
    }

    struct SharedIssue {
        nonce: Bytes64,
        path: Bytes64,
    }

    record Newsletter {
        owner: address,
        op: address,
        id: field,
        member_sequence: field,
        base: bool,
        revision: bool,
        title: Bytes64,
        title_nonce: Bytes24,
        template: Bytes64,
        template_nonce: Bytes24,
        content: Bytes64,
        content_nonce: Bytes24,
        group_symmetric_key: Bytes64,
        individual_private_key: Bytes64,
    }

    record Subscription {
        owner: address,
        op: address,
        id: field,
        member_sequence: field,
        member_secret_idx: field,
    }

    mapping newsletter_member_sequence: field => field;
    mapping member_secrets: field => SharedSecret;
    mapping newsletter_issue_sequence: field => field;
    mapping newsletter_issues: field => SharedIssue;

    function cantors_pairing(x: field, y: field) -> field {
        return (((x + y) * (x + y + 1field)) / 2field) + y;
    }

    function is_empty_bytes64(bytes: Bytes64) -> bool {
        let bytes_a_b_equality: bool = bytes.b0 == bytes.b1;
        let empty_bytes_ab: bool = bytes_a_b_equality && bytes.b0 == 0u128;
        let bytes_c_d_equality: bool = bytes.b2 == bytes.b3;
        let empty_bytes_cd: bool = bytes_c_d_equality && bytes.b2 == 0u128;
        return empty_bytes_ab && empty_bytes_cd;
    }

    // Determine fee estimates based on the following Ok amounts in rust:
    // https://github.com/AleoHQ/snarkVM/blob/e489fd283108f0ebf2558aac63f64968563d9c2a/synthesizer/src/vm/helpers/cost.rs#L24-L95
    // https://github.com/AleoHQ/snarkVM/blob/e489fd283108f0ebf2558aac63f64968563d9c2a/synthesizer/src/vm/helpers/cost.rs#L98

    transition main(title: Bytes64, title_nonce: Bytes24, template: Bytes64, template_nonce: Bytes24, content: Bytes64, content_nonce: Bytes24,  group_symmetric_key: Bytes64, individual_private_key: Bytes64, shared_public_key: Bytes64, shared_recipient: Bytes64) -> Newsletter {
        assert(!is_empty_bytes64(shared_public_key));
        assert(!is_empty_bytes64(shared_recipient));
        // let limit: u128 = 0u128.sub_wrapped(1u128) / 2u128;
        // let field_limit: field = 0field.sub(1field) / 2field;
        let idx: field = BHP256::hash_to_field(group_symmetric_key);
        // let member_idx: field = BHP256::hash_to_field(individual_private_key);
        let member_sequence: field = 1field;
        let member_secret_idx: field = cantors_pairing(idx, member_sequence);

        return Newsletter {
            owner: self.caller,
            op: self.caller,
            id: idx,
            member_sequence,
            base: true,
            revision: false,
            title,
            title_nonce,
            template,
            template_nonce,
            content,
            content_nonce,
            group_symmetric_key,
            individual_private_key,
        } then finalize (idx, member_sequence, member_secret_idx, shared_public_key, shared_recipient);
    }

    finalize main(idx: field, member_sequence: field, member_secret_idx: field, shared_public_key: Bytes64, shared_recipient: Bytes64) {
        assert(member_sequence == 1field);
        assert (Mapping::contains(newsletter_member_sequence, idx) == false);
        assert(Mapping::contains(member_secrets, member_secret_idx) == false);
        Mapping::set(newsletter_member_sequence, idx, member_sequence);
        Mapping::set(member_secrets, member_secret_idx, SharedSecret {
            shared_public_key: shared_public_key,
            recipient: shared_recipient,
        });
    }

    transition invite(newsletter: Newsletter, recipient: address) -> (Newsletter, Newsletter) {
        assert(newsletter.owner == self.caller);
        assert(newsletter.op == self.caller);
        assert(newsletter.base == true);
        assert(newsletter.revision == false);

        let member_id: field = newsletter.member_sequence + 1field;
        let empty_secret: Bytes64 = Bytes64 {
            b0: 0u128,
            b1: 0u128,
            b2: 0u128,
            b3: 0u128,
        };

        return (Newsletter {
            owner: self.caller,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: member_id,
            base: newsletter.base,
            revision: newsletter.revision,
            title: newsletter.title,
            title_nonce: newsletter.title_nonce,
            template: newsletter.template, 
            template_nonce: newsletter.template_nonce,
            content: newsletter.content,
            content_nonce: newsletter.content_nonce,
            group_symmetric_key: newsletter.group_symmetric_key,
            individual_private_key: newsletter.individual_private_key,
        }, Newsletter {
            owner: recipient,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: member_id,
            base: !newsletter.base,
            revision: !newsletter.revision,
            title: newsletter.title,
            title_nonce: newsletter.title_nonce,
            template: newsletter.template,
            template_nonce: newsletter.template_nonce,
            content: newsletter.content,
            content_nonce: newsletter.content_nonce,
            group_symmetric_key: newsletter.group_symmetric_key,
            individual_private_key: empty_secret,
        }) then finalize (newsletter.id, member_id);
    }

    finalize invite(idx: field, member_sequence: field) {
        assert(Mapping::contains(newsletter_member_sequence, idx) == true);
        Mapping::set(newsletter_member_sequence, idx, member_sequence);
    }

    transition accept(newsletter: Newsletter, secret: Bytes64, shared_public_key: Bytes64, shared_recipient: Bytes64) -> (Newsletter, Subscription, Subscription) {
        assert(self.caller == newsletter.owner);
        assert(self.caller != newsletter.op);
        assert(newsletter.base == false);
        assert(newsletter.revision == true);
        assert(!is_empty_bytes64(shared_public_key));
        assert(!is_empty_bytes64(shared_recipient));

        let member_secret_idx: field = cantors_pairing(newsletter.id, newsletter.member_sequence);

        return (Newsletter {
            owner: self.caller,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: newsletter.member_sequence,
            base: newsletter.base,
            revision: newsletter.revision,
            title: newsletter.title,
            title_nonce: newsletter.title_nonce,
            template: newsletter.template,
            template_nonce: newsletter.template_nonce,
            content: newsletter.content,
            content_nonce: newsletter.content_nonce,
            group_symmetric_key: newsletter.group_symmetric_key,
            individual_private_key: secret,
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
        }) then finalize (member_secret_idx, shared_public_key, shared_recipient);
    }

    finalize accept(member_secret_idx: field, shared_public_key: Bytes64, shared_recipient: Bytes64) {
        assert(Mapping::contains(member_secrets, member_secret_idx) == false);
        Mapping::set(member_secrets, member_secret_idx, SharedSecret {
            shared_public_key: shared_public_key,
            recipient: shared_recipient,
        });
    }

    transition deliver(newsletter: Newsletter, title: Bytes64, title_nonce: Bytes24, content: Bytes64, content_nonce: Bytes24, issue_path: Bytes64, issue_nonce: Bytes64) -> Newsletter {
        assert(newsletter.owner == self.caller);
        assert(!is_empty_bytes64(issue_path));
        assert(!is_empty_bytes64(issue_nonce));

        return Newsletter {
            owner: self.caller,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: newsletter.member_sequence,
            base: newsletter.base,
            revision: newsletter.revision,
            title: title,
            title_nonce: title_nonce,
            template: newsletter.template,
            template_nonce: newsletter.template_nonce,
            content: content,
            content_nonce: content_nonce,
            group_symmetric_key: newsletter.group_symmetric_key,
            individual_private_key: newsletter.individual_private_key,
        } then finalize (newsletter.id, issue_path, issue_nonce);
    }

    finalize deliver(id: field, issue_path: Bytes64, issue_nonce: Bytes64) {
        let x: field = id;
        let y: field = Mapping::get_or_use(newsletter_issue_sequence, id, 0field);
        let idx: field = (((x + y) * (x + y + 1field)) / 2field) + y;
        assert(Mapping::contains(newsletter_issues, idx) == false);
        Mapping::set(newsletter_issue_sequence, id, y + 1field);
        Mapping::set(newsletter_issues, idx, SharedIssue {
            nonce: issue_nonce,
            path: issue_path,
        });
    }

    transition update(newsletter: Newsletter, title: Bytes64, title_nonce: Bytes24, template: Bytes64, template_nonce: Bytes24, content: Bytes64, content_nonce: Bytes24) -> Newsletter {
        assert(newsletter.owner == self.caller);
        assert(newsletter.base == true);
        assert(newsletter.revision == false);

        return Newsletter {
            owner: self.caller,
            op: newsletter.op,
            id: newsletter.id,
            member_sequence: newsletter.member_sequence,
            base: newsletter.base,
            revision: newsletter.revision,
            title,
            title_nonce,
            template,
            template_nonce,
            content,
            content_nonce,
            group_symmetric_key: newsletter.group_symmetric_key,
            individual_private_key: newsletter.individual_private_key,
        };
    }


    transition unsub(subscription: Subscription) -> bool {
        assert(subscription.owner == self.caller || subscription.op == self.caller);

        let member_secret_idx: field = subscription.member_secret_idx;
        return subscription.owner == self.caller then finalize (member_secret_idx);
    }

    finalize unsub(member_secret_idx: field) {
        assert(Mapping::contains(member_secrets, member_secret_idx) == true);
        Mapping::remove(member_secrets, member_secret_idx);
    }
}
