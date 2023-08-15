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
