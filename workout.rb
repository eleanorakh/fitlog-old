require 'points'

class Workout
  include DataMapper::Resource

  property :id, Serial
  property :human_id, Integer
  property :exercise, String
  property :points, Integer
  property :minutes, Integer

  validates_presence_of :id, :human_id, :exercise, :points, :minutes

  def set_points!
    points = Points.new(nil)
    calculated_points = points.calculate_points_for(self.exercise, self.minutes)
    self.points = calculated_points
  end
end
