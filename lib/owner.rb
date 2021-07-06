require "pry"
class Owner
  @@all = []
  attr_reader :name, :species

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def name
    @name
  end

  def species
    @species
  end

  def say_species
    "I am a human."
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

  #instance method cats...
  def cats
    # takes the array of all Cat objects and returns a new array...
    Cat.all.select{
      #containing all cat instances where the owner attribute of each iterated cat instance is the same as the owner instance.
      |cat| cat.owner == self
    }
  end

  def dogs
    Dog.all.select{
      |dog| dog.owner == self
    }
  end

  #instance method buy_cat takes a name as an argument...
  def buy_cat(name)
    #creating a new instance of a cat of the Cat class with name argument and the owner instance via 'self' in order to associate the cat and owner.
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  #instance method walk_dogs/feed_cats...
  def walk_dogs
    #takes the owner's "dogs"/"cats" instance method arrays and respectively change each element's mood attribute to happy.
    dogs.collect{|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.collect{|cat| cat.mood = "happy"}
  end

  #instance method sell_pets
  def sell_pets
    #takes the owner's "dogs"/"cats" instance method arrays and respectively change each element's mood to "nervous" and each
    dogs.collect{|dog| dog.mood = "nervous"; dog.owner = nil}
    cats.collect{|cat| cat.mood = "nervous"; cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end