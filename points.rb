# classes are a way of organising code.
# variable always lower case
class Points
  def initialize(human)
    # instance variables starting with @ (shared in the class)
    @human = human

    @total_points = 0
  end

  #                        arguments
  def calculate_points_for(exercise, minutes)
    # set how much each exercise is worth
    # this {} is a hash - good for storing groups of two things
    values = {
      'jogging' => 4,
      'squats' => 32,
      'push ups' => 3
    }

    # pull out how many points for 'exercise'
    # we pull stuff out of hashes using []
    points = values[exercise]

    # times the points by the number of minutes 
    # Can create a variable with =
    calculated_points = points * minutes

    # += adds numbers to the variable
    @total_points += calculated_points

    # method outputs (returns) the last line
    calculated_points
  end

  def total_points
    'Total points for ' + @human.name + ': ' + @total_points.to_s  
  end
end
# always line break at end of file
