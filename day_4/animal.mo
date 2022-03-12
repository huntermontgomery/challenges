module {
    public type Animal = {
        species: Text;
        energy: Nat;
    };

 //Challenge 3
 // Challenges say 'increase by 10' but should possibly be 'decreased' as we're putting animal to sleep
    public func animal_sleep(animal: Animal) : Animal {
        var sleepy : Animal = {
            species = animal.species;
            energy = animal.energy + 10;
        };
        return sleepy;
    };
};