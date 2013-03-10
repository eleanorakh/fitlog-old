require 'points'

describe 'Points' do
  before do
    @human = stub(:name => 'Ron Weasley')
    @points = Points.new(@human)
  end

  describe 'total points' do
    it 'returns a useful string' do
      expect(@points.total_points).to eq "Total points for #{@human.name}: 0"
      # the #{} is called interpolation. interpolation brings ruby into a string.
    end
  end

  describe 'calculate points for' do
    it 'returns calculated points for jogging' do
      result = @points.calculate_points_for('jogging', 30)
      expect(result).to eq 120
    end

    it 'returns calculated points for squats' do
      result = @points.calculate_points_for('squats', 4)
      expect(result).to eq 128
    end

    it 'adds to total points' do
      @points.calculate_points_for('squats', 4)
      expect(@points.total_points).to eq "Total points for #{@human.name}: 128"
      @points.calculate_points_for('jogging', 20)
      expect(@points.total_points).to eq "Total points for #{@human.name}: 208"
    end

    it 'adds an error for invalid exercise' do
      @points.calculate_points_for('invalid exercise', 1)
      expect(@points.errors).to eq ['exercise invalid']
    end
  end
end
