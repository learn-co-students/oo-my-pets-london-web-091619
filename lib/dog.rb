class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  @@dogs = []

  def initialize(name, owner, mood = "nervous")
    @name = name
    @mood = mood
    @owner = owner
    save
  end

  def save
    @@dogs << self
  end

  def self.all
    @@dogs
  end
end
