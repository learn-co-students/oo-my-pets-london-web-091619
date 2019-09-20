class Owner
  attr_reader :name, :species

  @@all = []

  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
    @species = 'human'
    save
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select { |cat| cat.owner.eql?(self) }
  end

  def dogs
    Dog.all.select { |dog| dog.owner.eql?(self) }
  end

  def pets
    cats + dogs
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { |dog| dog.mood = 'happy' }
  end

  def feed_cats
    cats.each { |cat| cat.mood = 'happy' }
  end

  def sell_pets
    pets.each do |pet|
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end
