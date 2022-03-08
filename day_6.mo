import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Nat32 "mo:base/Nat32";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Buffer "mo:base/Buffer";
import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor {
    // Challenge 1 - Write func nat to nat8 converting nat n to nat 8, don't trap
    public func nat_to_nat8(n : Nat) : async ?Nat8 {
        if (n > 255) { return null; };
        return ?Nat8.fromNat(n);
    };

    // Challenge 2 - Write func max number with n bits; takes nat n and returns max with only n bits
    public func max_number_with_n_bits(n : Nat) : async Nat {
        return Nat.pow(2, n);
    };

    // Challenge 3 - Write a function decimal_to_bits that takes a Nat n and returns a Text corresponding to the binary representation of this number.
    public func decimal_to_bits(n : Nat) : async Text {
        if (n == 0) { return "0"; };
        var decimal : Nat = n;
        var bits : Text = "";
        while (decimal > 0) {
            bits := Nat.toText(decimal % 2) # bits;
            decimal := decimal / 2;
        };
        return bits;
    };

    // Challenge 4 - Write a function capitalize_character that takes a Char c and returns the capitalized version of it.
    private func capitalize_character(c : Char) : Char {
        var asc2 : Nat32 = Char.toNat32(c);
        if (Nat32.greaterOrEqual(asc2, 97) and Nat32.lessOrEqual(asc2, 122)) {
            return Char.fromNat32(asc2 - 32);
        };
        return c;
    };
   
    // Challenge 5 - Write a function capitalize_text that takes a Text t and returns the capitalized version of it.
    public func capitalize_text(t : Text) : async Text {
        return Text.map(t, func (c : Char) : Char {
            return capitalize_character(c);
        });
    };

    // Challenge 6 - Write a function is_inside that takes two arguments : a Text t and a Char c and returns a Bool indicating if c is inside t .
    private func is_inside(t : Text, c : Char) : Bool {
        return Text.contains(t, #char c);
    };
    // public func test_is_inside(t : Text, asc2 : Nat32) : async Bool {
    //     return is_inside(t, Char.fromNat32(asc2));
    // };

    // Challenge 7 - Write a function trim_whitespace that takes a text t and returns the trimmed version of t.
    public func trim_whitespace(t : Text) : async Text {
        return Text.trim(Text.trim(t, #char ' '), #char '　');
    };

    // Challenge 8 - Write a function duplicated_character that takes a Text t and returns the first duplicated character in t converted to Text.
    public func duplicated_character(t : Text) : async Text {
        var chars : [Char] = Iter.toArray(t.chars());
        var last_idx : Nat = chars.size() - 1;
        for (i in Iter.range(0, last_idx)) {
            for (j in Iter.range(i + 1, last_idx)) {
                if (Char.equal(chars[i], chars[j])) {
                    return Char.toText(chars[i]);
                };
            };
        };
        return t;
    };

    // Challenge 9 - Write a function size_in_bytes that takes Text t and returns the number of bytes this text takes when encoded as UTF-8.
    public func size_in_bytes(t : Text) : async Nat {
        return Text.encodeUtf8(t).size();
    };

    // Challenge 10 - Implement a function bubble_sort that takes an array of natural numbers and returns the sorted array .
    public func bubble_sort(nums : [Nat]) : async [Nat] {
        var sorted_nums : [var Nat] = Array.thaw(nums);
        var last_idx : Nat = sorted_nums.size() - 1;
        for (i in Iter.range(0, last_idx)) {
            for (j in Iter.range(0, last_idx - i - 1)) {
                if (sorted_nums[j] > sorted_nums[j+1]) {
                    var tmp = sorted_nums[j];
                    sorted_nums[j] := sorted_nums[j+1];
                    sorted_nums[j+1] := tmp;
                }; 
            };
        };
        return Array.freeze(sorted_nums);
    };
};