// The 'newsletter' program.
program newsletter.aleo {

    struct AddressList {
        a0: address,
        a1: address,
        a2: address,
        a3: address,
        a4: address,
        a5: address,
        a6: address,
        a7: address,
        a8: address,
        a9: address,
        a10: address,
        a11: address,
        a12: address,
        a13: address,
        a14: address,
        a15: address,
        a16: address,
        a17: address,
        a18: address,
        a19: address,
        a20: address,
        a21: address,
        a22: address,
        a23: address,
        a24: address,
        a25: address,
        a26: address,
        a27: address,
        a28: address,
        a29: address,
        a30: address,
        a31: address,
    }

    record Newsletter {
        owner: address,
        title: field,
        content: field,
        secret: field,
        recipients: AddressList,
        members: u8,
    }

    function count_members(a: AddressList) -> u8 {
        let count: u8 = 0u8;
        if (a.a0 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a1 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a2 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a3 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a4 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a5 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a6 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a7 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a8 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a9 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a10 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a11 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a12 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a13 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a14 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a15 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a16 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a17 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a18 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a19 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a20 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a21 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a22 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a23 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a24 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a25 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a26 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a27 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a28 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a29 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a30 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        if (a.a31 != aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc) {
            count = count + 1u8;
        }
        return count;
    }

    function insert_member(a: AddressList, b: address, c: u8) -> AddressList {
        assert(c > 0u8);
        assert(c <= 32u8);
        if (c == 32u8) {
            return a;
        }
        if c == 1u8 {
            return AddressList {
                a0: a.a0,
                a1: b,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 2u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: b,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 3u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: b,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 4u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: b,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 5u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: b,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 6u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: b,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 7u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: b,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 8u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: b,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 9u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: b,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 10u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: b,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 11u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: b,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 12u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: b,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 13u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: b,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 14u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: b,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if c == 15u8 {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: b,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 16u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: b,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 17u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: b,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 18u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: b,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 19u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: b,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 20u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: b,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 21u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: b,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 22u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: b,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 23u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: b,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 24u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: b,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 25u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: b,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 26u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: b,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 27u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: b,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 28u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: b,
                a29: a.a29,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 29u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: b,
                a30: a.a30,
                a31: a.a31,
            };
        }
        if (c == 30u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: b,
                a31: a.a31,
            };
        }
        if (c == 31u8) {
            return AddressList {
                a0: a.a0,
                a1: a.a1,
                a2: a.a2,
                a3: a.a3,
                a4: a.a4,
                a5: a.a5,
                a6: a.a6,
                a7: a.a7,
                a8: a.a8,
                a9: a.a9,
                a10: a.a10,
                a11: a.a11,
                a12: a.a12,
                a13: a.a13,
                a14: a.a14,
                a15: a.a15,
                a16: a.a16,
                a17: a.a17,
                a18: a.a18,
                a19: a.a19,
                a20: a.a20,
                a21: a.a21,
                a22: a.a22,
                a23: a.a23,
                a24: a.a24,
                a25: a.a25,
                a26: a.a26,
                a27: a.a27,
                a28: a.a28,
                a29: a.a29,
                a30: a.a30,
                a31: b,
            };
        }

        // If we reach here, something went wrong.
        return a;
    }

    transition main(title: field, content: field, secret: field) -> Newsletter {
        let recipients: AddressList = AddressList {
            a0: self.caller,
            a1: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a2: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a3: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a4: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a5: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a6: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a7: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a8: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a9: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a10: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a11: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a12: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a13: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a14: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a15: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a16: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a17: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a18: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a19: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a20: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a21: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a22: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a23: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a24: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a25: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a26: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a27: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a28: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a29: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a30: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
            a31: aleo1qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq3ljyzc,
        };
        
        return Newsletter {
            owner: self.caller,
            title,
            content,
            secret,
            recipients,
            members: count_members(recipients),
        };
    }

    transition invite(newsletter: Newsletter, recipient: address) -> (Newsletter, Newsletter) {
        assert(newsletter.owner == self.caller);
        assert(newsletter.recipients.a0 == self.caller);
        assert(newsletter.members < 32u8);
        assert(newsletter.recipients.a0 != recipient);
        assert(newsletter.recipients.a1 != recipient);
        assert(newsletter.recipients.a2 != recipient);
        assert(newsletter.recipients.a3 != recipient);
        assert(newsletter.recipients.a4 != recipient);
        assert(newsletter.recipients.a5 != recipient);
        assert(newsletter.recipients.a6 != recipient);
        assert(newsletter.recipients.a7 != recipient);
        assert(newsletter.recipients.a8 != recipient);
        assert(newsletter.recipients.a9 != recipient);
        assert(newsletter.recipients.a10 != recipient);
        assert(newsletter.recipients.a11 != recipient);
        assert(newsletter.recipients.a12 != recipient);
        assert(newsletter.recipients.a13 != recipient);
        assert(newsletter.recipients.a14 != recipient);
        assert(newsletter.recipients.a15 != recipient);
        assert(newsletter.recipients.a16 != recipient);
        assert(newsletter.recipients.a17 != recipient);
        assert(newsletter.recipients.a18 != recipient);
        assert(newsletter.recipients.a19 != recipient);
        assert(newsletter.recipients.a20 != recipient);
        assert(newsletter.recipients.a21 != recipient);
        assert(newsletter.recipients.a22 != recipient);
        assert(newsletter.recipients.a23 != recipient);
        assert(newsletter.recipients.a24 != recipient);
        assert(newsletter.recipients.a25 != recipient);
        assert(newsletter.recipients.a26 != recipient);
        assert(newsletter.recipients.a27 != recipient);
        assert(newsletter.recipients.a28 != recipient);
        assert(newsletter.recipients.a29 != recipient);
        assert(newsletter.recipients.a30 != recipient);
        assert(newsletter.recipients.a31 != recipient);

        let recipients: AddressList = insert_member(newsletter.recipients, recipient, newsletter.members);

        return (Newsletter {
            owner: self.caller,
            title: newsletter.title,
            content: newsletter.content,
            secret: newsletter.secret,
            recipients,
            members: newsletter.members + 1u8,
        }, Newsletter {
            owner: recipient,
            title: newsletter.title,
            content: newsletter.content,
            secret: newsletter.secret,
            recipients,
            members: newsletter.members + 1u8,
        });
    }

    transition update(newsletter: Newsletter, title: field, content: field, recipient: address) -> (Newsletter, Newsletter) {
        assert(newsletter.owner == self.caller);
        let access: bool = false;
        if (newsletter.recipients.a1 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a2 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a3 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a4 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a5 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a6 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a7 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a8 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a9 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a10 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a11 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a12 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a13 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a14 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a15 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a16 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a17 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a18 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a19 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a20 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a21 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a22 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a23 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a24 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a25 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a26 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a27 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a28 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a29 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a30 == recipient) {
            access = true;
        }
        if (newsletter.recipients.a31 == recipient) {
            access = true;
        }
        assert(access);

        return (Newsletter {
            owner: self.caller,
            title,
            content,
            secret: newsletter.secret,
            recipients: newsletter.recipients,
            members: newsletter.members,
        }, Newsletter {
            owner: recipient,
            title,
            content,
            secret: newsletter.secret,
            recipients: newsletter.recipients,
            members: newsletter.members,
        });
    }

}
