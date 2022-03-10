import Dog "custom";
import Animal "animal";
import List "mo:base/List";

actor {

//Challenge 1 
  public func fun() : async Dog.Dog {
    var dog : Dog.Dog = {
        breed = "Ridgeback";
        desexed = true;
        color = "brown";
        age = 2;
    };
    return dog;
  };

 //Challenge 2
  public type Animal = Animal.Animal;

  var monkey : Animal = {
    species = "Monkey";
    energy = 2;
  };

//Challenge 4 (C3 in animal.mo)
  public func create_animal_then_takes_a_break(species : Text, energy : Nat) : async Animal {
    var animal : Animal = {
      species = species;
      energy = energy;
    };
    return Animal.animal_sleep(animal);
  };

//Challenge 5
  public type List<Animal> = ?(Animal, List<Animal>);

};

//Challenge 6
  public func push_animal(animal: Animal) async () {
    animals := List.push(_animal, animals);
  };
  public func get_animal() : async [Animal] {
    return List.toArray<Animal>(animal_list);
    
  }