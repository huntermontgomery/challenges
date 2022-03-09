import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Array "mo:base/Array";

actor {

/* Challenge 1 - write priv function swap, takes 3 prams: mut array, index j, and index i
Returns same array but where value at index i and index j have been swapped */
    func swap<T>(arr: [var T], i: Nat, j: Nat): [var T] {
        let unchanged = arr[i];
        arr[i] := arr[j];
        arr[j] := unchanged;

        return arr;
    };
};

// Challenge 2 - write func init_count; takes Nat n, returns array [Nat] where value is equal to it's corresponding index
 public func init_count(n: Nat) : async [Nat] {
    return Iter.toArray<Nat>(Iter.range(0, n-1));
  };

/* Challenge 3 - write func seven that takes array [Nat], 
returns seven is found if one digit of any number is seven, otherwise return seven not found */
  public func seven(array: [Nat]) : async Text {
    let sevenChar : Nat32 = 55;
    for (v in array.vals()) {
      let t : Text = Nat.toText(v);
      for (c in Text.toIter(t)) {
        if (Char.toNat32(c) == sevenChar) {
          return "Seven is found";
        };
      };
    };
    return "Seven not found";
   };  

/* Challenge 4 - Write a function nat_opt_to_nat that takes two parameters : n of type ?Nat and m of type Nat . 
This function will return the value of n if n is not null and if n is null it will default to the value of m. */
    public query func nat_opt_to_nat(n:?Nat, m: Nat): async Nat{
        return Option.get(n, m);    
    };

/* Challenge 5 - Write a function day_of_the_week that takes a Nat n and returns a Text value corresponding to the day. 
If n doesn't correspond to any day it will return null .

day_of_the_week (1) -> "Monday".
day_of_the_week (7) -> "Sunday".
day_of_the_week (12) -> null.  */

    public query func day_of_the_week(n: Nat): async ?Text{
        if(n >= 1 and n <= 7){
            let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
            return ?days[n-1];
        };
        return null;
    };

/* Challenge 6 - Write a function populate_array that takes an array [?Nat] and returns an array [Nat] 
where all null values have been replaced by 0. */

  public func populate_array(array: [?Nat]) : async [Nat] {
    let f = func (n : ?Nat) : Nat {
      return Option.get(n, 0)
    };
    return Array.map<?Nat, Nat>(array, f);
  };

/* Challenge 7 - Write a function sum_of_array that takes an array [Nat] 
and returns the sum of a values in the array. Note : Do not use a loop. */

  public func sum_of_array(array: [Nat]) : async Nat {
    var sum : Nat = 0;
    let f = func (n : Nat) : Nat {
      sum += n;
      return n;
    };
    let mapped = Array.map<Nat, Nat>(array, f);
    return sum;
  };

/* Challenge 8 - Write a function squared_array that takes an array [Nat] and returns a new array where each value has been squared.
Note : Do not use a loop. */

    public query func squared_array(arr: [Nat]): async [Nat] {
        Array.map<Nat, Nat>(arr, func(n){
            return n * n;
        })
    };

/* Challenge 9 - Write a function increase_by_index that takes an array [Nat] 
and returns a new array where each number has been increased by it's corresponding index.

Note : increase_by_index [1, 4, 8, 0] -> [1 + 0, 4 + 1 , 8 + 2 , 0 + 3] = [1,5,10,3]
Note 2 : Do not use a loop. */

  public func increase_by_index(array: [Nat]) : async [Nat] {
    let f = func (n : Nat, i : Nat) : Nat {
      return n + i;
    };
    return Array.mapEntries<Nat, Nat>(array, f);
  };

/* Challenge 10 - Write a higher order function contains<A> that takes 3 parameters : 
an array [A] , a of type A and a function f that takes a tuple of type (A,A) and returns a boolean.

This function should return a boolean indicating whether or not a is present in the array. */

     func contains<A>(arr: [A], a: A, f: ((A, A))-> Bool):  Bool{
        for (n in arr.vals()){
            if (f(n, a)){
                return true;
            };
        };
        return false;
    };

    public query func testContains(arr: [Nat], a: Nat): async Bool{
        return contains<Nat>(arr, a, func(a, b) {a==b});
    };
}
