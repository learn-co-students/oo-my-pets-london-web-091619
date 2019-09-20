class Owner

attr_reader :name, :species

@@count = 0
@@all = []

def initialize(name)
  @species = "human"
  @name = name
  @@count += 1
  @@all << self
end

def say_species
  return "I am a human."
end

def self.all
@@all
end

def self.count
  @@count
end

def self.reset_all
  @@count = 0
end

def cats
  Cat.all.select{|cat| cat.owner == self}
end

def dogs
  Dog.all.select{|dog| dog.owner == self}
end

def walk_dogs
  dogs.each{|dog| dog.mood = "happy"}
end

def feed_cats
  cats.each{|cat| cat.mood = "happy"}
end

def buy_cat(name)
  Cat.new(name,self)
end

def buy_dog(name)
  Dog.new(name,self)
end

def sell_pets
dogs.each{|dog|
  dog.mood = "nervous"
  dog.owner = nil
}
cats.each{|cat|
  cat.mood = "nervous"
  cat.owner = nil
}
end

def list_pets
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
end



end
