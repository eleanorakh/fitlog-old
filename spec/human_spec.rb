require 'human'

describe 'Human' do
  describe 'with valid attributes' do
    before do
      @human = Human.new(:name => 'Odin', :weight => 60, :height => 5.11, :fitness_level => 1)
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
      human = Human.new(:name => 'Unfit', :weight => 90, :height => 5.3, :fitness_level => 0)
      human.valid?
      expect(human.errors.last).to eq ['Fitness level must be between 1 and 5']
    end

    it 'must be below 5' do
      human = Human.new(:name => 'Unfit', :weight => 90, :height => 5.3, :fitness_level => 7)
      human.valid?
      expect(human.errors.last).to eq ['Fitness level must be between 1 and 5']
    end
  end
end

# DRY: Don't Repeat Yourself
