class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@cats = []

  def initialize(name, owner, mood = "nervous")
    @name = name
    @mood = mood
    @owner = owner
    save
  end

  def save
    @@cats << self
  end

  def self.all
    @@cats
  end
end
