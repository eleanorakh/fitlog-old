require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/dev.db")

require 'workout'

DataMapper.finalize.auto_upgrade!

describe Workout do
  describe 'saving' do
    it 'saves with correct points' do
      workout = Workout.new(:human_id => 1, :exercise => 'squats', :minutes => 4)
      workout.set_points!
      workout.save
      expect(workout.points).to eq 128

      workout_2 = Workout.new(:human_id => 1, :exercise => 'jogging', :minutes => 30)
      workout_2.set_points!
      workout_2.save
      expect(workout_2.points).to eq 120
    end

    it 'creates a valid workout' do
      pending
    end
  end
end
