class Human
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :weight, Integer
  property :height, Integer
  property :fitness_level, Integer

  validates_presence_of :fitness_level
  validates_within :fitness_level, :set => 1..5

  # adds a method to the object to read the instance variable.
  attr_reader :name
  attr_reader :weight
  attr_reader :height
  attr_accessor :fitness_level

  def initialize(name, weight, height, fitness_level)
    @name = name
    @weight = weight
    @height = height
    @fitness_level = fitness_level
  end
end
