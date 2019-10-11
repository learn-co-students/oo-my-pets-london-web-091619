class Owner
  
attr_reader :name, :species

@@all = [ ]

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
      @@all.count
    end

    def self.reset_all
      @@all.clear
    end

    def cats
      Cat.all.select { |cats| cats.owner == self}
    end

    def dogs
      Dog.all.select { |dogs| dogs.owner == self}
    end

    def buy_cat(name)
      Cat.new(name, self)
    end

    def buy_dog(name)
      Dog.new(name, self)
    end

    def feed_cats
      Cat.all.each do |cat|
        cat.mood = "happy"
      end
    end

    def walk_dogs
      Dog.all.each do |dog|
        dog.mood = "happy"
      end
    end

    def sell_pets
      Cat.all.each do |cat|
        cat.mood = "nervous"
        cat.owner = nil
      end

      Dog.all.each do |dog|
        dog.mood = "nervous"
        dog.owner = nil
      end
      pets = cats + dogs
      pets.clear
    end

    def list_pets
     pets = cats + dogs
     return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end




end