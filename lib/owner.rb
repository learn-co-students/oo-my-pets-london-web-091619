class Owner
  attr_reader :name, :species

  @@owner_count = 0
  @@owners = []

  def initialize(species = "human", name)
    @species = species
    @name = name
    @@owner_count += 1
    save
  end

  def save
    @@owners << self
  end

  def say_species
    return "I am a #{self.species}."
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def all_pets
    pets = []
    cats.each { |cat| pets << cat }
    dogs.each { |dog| pets << dog }
    pets
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.map { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.map { |cat| cat.mood = "happy" }
  end

  def sell_pets
    all_pets.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def self.all
    @@owners
  end

  def self.count
    @@owner_count
  end

  def self.reset_all
    @@owner_count = 0
  end
end
