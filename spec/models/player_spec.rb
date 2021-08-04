require 'rails_helper'

RSpec.describe Player do
  before :each do
    @team_1 = Team.create!(hometown: 'Lawrence', nickname: 'Jayhawks')
    
    @team_1.players.create!(name: 'Billy Bigshoes', age: 18)
    @team_1.players.create!(name: 'Julius Wright', age: 22)
    @team_1.players.create!(name: 'Russel Robinson', age: 20)
  end
  describe 'relationships' do
    it { should belong_to(:team) }
  end

  describe '::class methods' do
    describe '::average_age' do
      it 'can determine the average age of all players' do
        expect(Player.average_age).to eq(20.0)
      end
    end
  end
end
