class Owner
  attr_reader :name, :species
  @@all = []

  # Instance methods
  def initialize name
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end

  def buy_cat name
    #cat = Cat.find_cat_by_name name
    #cat.owner = self
    cat = Cat.new name, self
  end

  def buy_dog name
    dog = Dog.new name, self
  end

  def walk_dogs
    puts "walk dogs"
    puts self.dogs.inspect
    self.dogs.each {|dog| dog.mood = "happy"}
    puts self.dogs.inspect
  end

  # Class methods
  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end
end
