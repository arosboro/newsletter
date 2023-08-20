# newsletter_v0_1_0.aleo

Introducing Cipher Page, an off-chain encryption-based communication platform. I believe this work holds value within the Aleo Ecosystem, as it aims to raise awareness about privacy and enables users to embrace zero-knowledge concepts without the need to comprehend the intricate technical details. Instead, users can interact through a wallet and user interface. The frontend incorporates multiple examples, licensed under the copy-left (GPL) license, which any user can utilize as a foundation for building a React frontend. Additionally, the Aleo contract itself introduces novel concepts for implementing both public and private aspects of the application logic using mappings.

## Build Guide

Copy program.example.json to program.json and fill in the values you wish to change.
If the address is changed in program.json, the Makefile will need to be updated to
reflect the new address as record.owner in many cases.

To test this Aleo program, run:

```bash
make test
```

This Makefile contains example commands for testing each transition.  The program has a frontend at https://github.com/arosboro/newsletter-fe.  While it is difficult to operate from the command line, it is recommended to use the frontend either locally or hosted at https://cipher.page to interact with the deployed `newsletter_v0_1_0.aleo` contract.

# Newsletter Frontend

A frontend to handle asymmetric and symmetric key management between disparate parties. Users can create groups with the `newsletter_v0_1_0.aleo` contract and invite members to deliver issues (new content). Newsletters contain contents and template structure which is a loose representation of content. Privacy mode can be toggled on or off to show the cipher text of any given input.

## Project Frameworks

- Vite
- React
- Redux Toolkit
- @DemoxLabs Aleo Wallet Adapter
- Vitest
- Vite Plugin WASM Pack (leveraging snarkvm-wasm)
- Aleo

## Structs

- `Bytes24`: This struct contains 24 `u8` values that convert to 1 byte each. The entire value is frequently utilized as a BigInt nonce, for example.
- `Bytes64`: This struct holds four `u128` values, each of which maps to 16 bytes. When combined, these values represent a value under 64 bytes.
- `SharedIssue`: This struct holds the nonce and path (to IPFS) for the Group symmetric encrypted value which can be decrypted using `key` and `path`.

## Records

### Newsletter

- `owner`: This is the record holder
- `op`: This is the record instantiating address
- `id`: This is a unique field value based on a BHP 256 `hash_to_field` algorithm running on the `op`
- `member_sequence`: The op chooses members to invite, and each time increments the member sequence so the number of members invited is reflected by this field value.
- `base`: Whether or not the record owner is the op. Base indicates it's an owned record not a derivative record (Meaning it's not being used to deliver as an accepted subscriber, but rather the Newsletter creator holds the record).
- `revision`: True when the record has been received through an invitation but not initially created by the record holder.
- `title`: Bytes64 the IPFS path to the cipher-text of the title.
- `title_nonce`: Bytes24 the u8IntArray nonce of the cipher-text.
- `template`: Bytes64 the IPFS path to the cipher-text of the template.
- `template_nonce`: Bytes24 the u8IntArray nonce of the cipher-text.
- `content`: Bytes64 the IPFS path to the cipher-text of the content.
- `content_nonce`: Bytes24 the u8IntArray nonce of the cipher-text.
- `group_symmetric_key`: Bytes64 the symmetric key for Group Encrypted Messaging.
- `individual_private_key`: Bytes64 the individual private key paired to the mapping of the public key which indicates the user accepted the invite.

### Subscription

- `owner`: The owner either `op` or the subscriber
- `op`: The manager of the group.
- `id`: This is a unique field value based on a BHP 256 `hash_to_field` algorithm running on the `op`
- `member_sequence`: This field value pertains to the sequence the member used with the cantor's pairing function in the mapping assignment.
- `member_secret_idx`: This field value identifies the combination of the id and member sequence provided by cantor's pairing function.

## Mappings

- `newsletter_member_sequence`: (Field => Field) The newsletter id is indexed to determine how many members have been invited to the newsletter group.
- `member_secrets`: (Field => SharedSecret) The cantor's pairing of member sequence of each member is mapped to Shared Public Key and Public Address
- `newsletter_issue_sequence`: (Field => Field) Each time a member delivers an issue the sequence increments with respect to the key: newsleter.id.
- `newsletter_issues`: (Field => SharedIssue) Cantor's pairing with each  and  is used to capture the path to each digest and nonce of every encrypted field for all subscribers.

## Transitions

### main

**Inputs:**

- `title`: Bytes64 the IPFS path to the title.
- `title_nonce`: Bytes24 the nonce from the sodium library.
- `template`: Bytes64 the IPFS path to the template.
- `template_nonce`: Bytes24 the nonce from the sodium library
- `content`: Bytes64 the IPFS path to the content.
- `content_nonce`: Bytes24 the nonce from the sodium library.
- `group_symmetric_key`: Bytes64 the key for group communication.
- `individual_private_key`: Bytes64 the key for decrypting own messages.
- `shared_public_key`: Bytes64 the key that other people can use to send messages.
- `shared_recipient`: Bytes64 the address for other transitions and messages.

### invite

**Inputs:**

- `newsletter`: Newsletter the record indicating you can invite members to this group.
- `recipient`: address the user's address you want to send an invite to.

### accept

**Inputs:**

- `newsletter`: Newsletter the record you received as a result of another user executing invite.
- `secret`: Bytes64 your private key.
- `shared_public_key`: Bytes64 the public key to match your secret.
- `shared_recipient`: Bytes64 the address you signed up with.

### deliver

**Inputs:**

- `newsletter`: Newsletter a newsletter record you hold.
- `title`: Bytes64 the IPFS path to the title you updated.
- `title_nonce`: Bytes24 the U8IntArray of the nonce you used.
- `content`: Bytes64 the IPFS path to the content you updated.
- `content_nonce`: Bytes24 the U8IntArray of the nonce you used.
- `issue_path`: Bytes64 The IPFS path of the digests for every member receiving an issue.
- `issue_nonce`: Bytes64 The U8IntArray of the nonce using Group Symmetric key which encrypted issue path's contents.

### update

**Inputs:**

- `newsletter`: Newsletter a newsletter record you hold.
- `title`: Bytes64 the IPFS path to the title you updated.
- `title_nonce`: Bytes24 the U8IntArray of the nonce you used.
- `template`: Bytes64 the IPFS path to the template you updated.
- `template_nonce`: Bytes24 the U8IntArray of the nonce you used.
- `content`: Bytes64 the IPFS path to the content you updated.
- `content_nonce`: Bytes24 the U8IntArray of the nonce you used.

### unsub

**Inputs:**

- `subscription`: The subscription you wish to unsubscribe from.

## Helper Functions

- `cantors_pairing`: Map two field values to a field value which will not intersect if there is sufficient entropy when choosing `path`.
- `is_empty_bytes64`: Determine if a Bytes64 struct contains only `0u128` values for `b0`, `b1`, `b2`, `b3`. Return `bool`.
