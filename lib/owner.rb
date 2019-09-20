class Owner
  attr_reader :name, :species
  
  @@all = []
  
 def initialize(name, species = "human")
   @name = name
   @species = species
   @@all << self
 end
 
 def say_species
   "I am a #{species}."
 end
 
 def self.all
   @@all
 end
 
 def self.count
   self.all.count
 end
 
 def self.reset_all
   self.all.clear
 end
 
 def cats
   Cat.all.select {|cat| cat.owner == self}
 end
 
 def dogs 
   Dog.all.select {|dog| dog.owner == self}
 end
 
 def buy_cat(name)
   Cat.new(name, self)
   #make new instance of the pet
   #initialize it with that name and the owner who is purchasing it
 end
 
 def buy_dog(name)
   Dog.new(name, self)
 end
 
 def walk_dogs
   self.dogs.each {|dog| dog.mood = "happy" }
 end
 
 def feed_cats
   self.cats.each {|cat| cat.mood = "happy"}
 end
 
 def sell_pets
   pets = self.dogs + self.cats
   
   pets.each {|pet| pet.mood = "nervous"}
   pets.each {|pet| pet.owner = nil}
 end
 
 def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
 end
end