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
    all = Cat.all.find_all {|cat| cat.owner == self }
    puts "ALL CATS"
    puts all.inspect
    all
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end

  def buy_cat name
    cat = Cat.find_cat_by_name name
    puts "CAT"
    puts cat.inspect
    cat.owner = self
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
