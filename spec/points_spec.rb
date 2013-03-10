require 'points'

describe 'Points' do
  describe 'total points' do
    it 'returns a useful string' do
      human = stub(:name => 'Ron Weasley')
      points = Points.new(human)
      expect(points.total_points).to eq "Total points for #{human.name}: 0"
      # the #{} is called interpolation
    end
  end
end
