class Human
  # adds a method to the object to read the instance variable.
  attr_reader :name
  attr_reader :weight
  attr_reader :height
  attr_accessor :fitness_level
  attr_reader :errors

  def initialize(name, weight, height, fitness_level)
    @errors = [] # empty Array

    @name = name
    @weight = weight
    @height = height
    @fitness_level = fitness_level

    valid?
  end

  def fitness_level_valid?(fitness_level)
    if fitness_level.nil?
      @errors << 'fitness level must be set'
      false
    else
      if fitness_level > 5
        @errors << 'fitness level must be below 5'
        false
      elsif fitness_level < 1
        @errors << 'fitness level must be above 1'
        false
      else
        true
      end
    end
  end

  def last_error
    @errors.last
  end

  def valid?
    fitness_level_valid?(@fitness_level)
  end

  def clear_errors
    if valid? 
      @errors = []
    end
  end
end
