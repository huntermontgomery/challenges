import Nat "mo:base/Nat";
import Array "mo:base/Array";

actor {
  
//Challenge 1 - write func add; adding two natural numbers (n & m) and returning the sum
  public func add(n: Nat, m: Nat) : async Nat {
    return n + m;
  };

//Challenge 2 - write func square; taking n and retruns the area of a square of length n
  public func square(n: Nat) : async Nat {
    return n * n;
  };

//Challenge 3 - write func days_to_second; taking number of days (n) and returns number of seconds
  public func days_to_second(n: Nat) : async Nat {
    return n * 24 * 60 * 60;
  };    

//Challenge 4 - write func increment counter (returns the incremented value of counter by n) & func clear counter (sets counter value to 0)
  var counter : Nat = 0;

  public func increment_counter(n: Nat) : async Nat {
    counter += n;
    return counter;
  };    

  public func clear_counter() : async Nat {
    counter := 0;
    return counter;
  };    

//Challenge 5 - write func divide; taking two nats (n & m) and returns boolean indicating if n divides m
  public func divide(n: Nat, m: Nat) : async Bool {
    if (n % m == 0) {
      return true;
    } else {
        return false;
    };
  };    

//Challenge 6- write func is_even; taking natural number n and returns bool indicating if n is even
  public func is_even(n: Nat) : async Bool {
    if (n % 2 == 0) {
      return true;
    } else {
        return false;
    };
  }; 

//Challenge 7 - write func sum_of_array; taking an array of nats and returning sum (returns 0 if array empty)  
  public func sum_of_array(nums : [Nat]) : async Nat {
    if (nums.size() != 0) {
        var sum = 0;
        for (num in nums.vals()){
           sum += num;
        };
        return sum;
    };
    return 0;
  };

//Challenge 8 - write func maximum; taking array of nats and returning max value in array. returns 0 if array empty
  public func maximum(nums : [Nat]) : async Nat {
      if (nums.size() != 0) {
          var max = nums[0];
          for (num in nums.vals()){
              if (num > max) {
                  max := num;
              };
          };
          return max;
      };
      return 0;
  };

//Challenge 9 - write func remove_from_array; takes two parameters (array of nats and nat (n)) and returns new array where n has been removed and order unchanged
  public func remove_from_array(nums : [Nat], n : Nat) : async [Nat] {
      return Array.filter(nums, func (_n : Nat) : Bool {
          return _n != n;
      });
  };

//Challenge 10 - implement func selection_sort; takes an array of Nats and returns sorted array
  public func selection_sort(nums : [Nat]) : async [Nat] {
      return Array.sort(nums, Nat.compare);
  };

};
