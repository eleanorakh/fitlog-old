class Human
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :weight, Integer
  property :height, Float
  property :fitness_level, Integer

  validates_presence_of :fitness_level
  validates_within :fitness_level, :set => 1..5
end
