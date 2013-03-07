require 'human'

describe 'Human' do
  describe 'with valid attributes' do
    before do
      @human = Human.new('Odin', 60, 5.11, 1)
    end

    it 'has a name' do
      expect(@human.name).to eq 'Odin'
    end

    it 'has a weight' do
      expect(@human.weight).to eq 60
    end

    it 'has a height' do
      expect(@human.height).to eq 5.11
    end

    it 'has a fitness level' do
      expect(@human.fitness_level).to eq 1
    end
  end

  describe 'fitness level' do
    it 'must be above 1' do
      human = Human.new('Unfit', 90, 5.3, 0)
      expect(human.last_error).to eq 'fitness level must be above 1'
    end

    it 'must be below 5' do
      human = Human.new('Unfit', 90, 5.3, 7)
      expect(human.last_error).to eq 'fitness level must be below 5'
    end
  end
end

# DRY: Don't Repeat Yourself
