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
      human.valid?
      expect(human.last_error).to eq 'fitness level must be above 1'
    end

    it 'must be below 5' do
      human = Human.new('Unfit', 90, 5.3, 7)
      human.valid?
      expect(human.last_error).to eq 'fitness level must be below 5'
    end
  end

  describe 'last error' do
    it 'returns the last error' do
      human = Human.new('Unfit', 90, 5.3, 7)
      human.valid?
      # => ['fitness level must be below 5']
      expect(human.errors.count).to eq 1

      human.fitness_level = 0
      human.valid?
      # => ['fitness level must be below 5', 'fitness level must be above 1']
      expect(human.errors.count).to eq 2

      expect(human.last_error).to eq human.errors.last
    end
  end

  describe 'clear errors' do
    it 'clears all errors' do
      human = Human.new('Error', 60, 5.5, 8)
      human.clear_errors
      expect(human.errors).to eq ['fitness level must be below 5']

      human.fitness_level = 4
      human.clear_errors
      expect(human.errors).to eq []
    end
  end
end

# DRY: Don't Repeat Yourself
