# newsletter_v0_0_8.aleo

## Build Guide

Copy program.example.json to program.json and fill in the values you wish to change.
If the address is changed in program.json, the Makefile will need to be updated to
reflect the new address as record.owner in many cases.

To compile this Aleo program, run:

```bash
snarkvm build
```

To execute this Aleo program, run:

```bash
snarkvm run hello
```

To test this Aleo program, run:

```bash
make test
```

# Newsletter Frontend

A frontend to handle asymmetric and symmetric key management between disparate parties. Users can create groups with the `newsletter_v0_0_8.aleo` contract and invite members to deliver issues (new content). Newsletters contain contents and template structure which is a loose representation of content. Privacy mode can be toggled on or off to show the cipher text of any given input.

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
- ...

### Subscription

- `owner`: The owner either `op` or the subscriber
- `op`: The manager of the group.
- `id`: This is a unique field value based on a BHP 256 `hash_to_field` algorithm running on the `op`

## Mappings

- `newsletter_member_sequence`: (Field => Field) The newsletter id is indexed to determine how many members have been invited to the newsletter group.
- `member_secrets`: (Field => SharedSecret) The cantor's pairing of member sequence of each member is mapped to Shared Public Key and Public Address
- ...

## Transitions

### main

**Inputs:**

- `title`: Bytes64 the IPFS path to the title.
- ...

### invite

**Inputs:**

- `newsletter`: Newsletter the record indicating you can invite members to this group.
- `recipient`: address the user's address you want to send an invite to.

### accept

**Inputs:**

- `newsletter`: Newsletter the record you received as a result of another user executing invite.
- `secret`: Bytes64 your private key.
- ...

### deliver

**Inputs:**

- `newsletter`: Newsletter a newsletter record you hold.
- `title`: Bytes64 the IPFS path to the title you updated.
- ...

### update

**Inputs:**

- `newsletter`: Newsletter a newsletter record you hold.
- `title`: Bytes64 the IPFS path to the title you updated.
- ...

### unsub

**Inputs:**

- `subscription`: The subscription you wish to unsubscribe from.

## Helper Functions

- `cantors_pairing`: Map two field values to a field value which will not intersect if there is sufficient entropy when choosing `path`.
- `is_empty_bytes64`: Determine if a Bytes64 struct contains only `0u128` values for `b0`, `b1`, `b2`, `b3`. Return bool.
