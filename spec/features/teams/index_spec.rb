require 'rails_helper'

RSpec.describe 'Teams Index Page' do
  before :each do
    @team_1 = Team.create!(hometown: 'Lawrence', nickname: 'Jayhawks')
    @team_2 = Team.create!(hometown: 'Austin', nickname: 'Longhorns')
    @team_3 = Team.create!(hometown: 'Norman', nickname: 'Sooners')

    @team_1.players.create!(name: 'Billy Bigshoes', age: 18)
    @team_1.players.create!(name: 'Julius Wright', age: 22)
    @team_1.players.create!(name: 'Russel Robinson', age: 20)
    @team_2.players.create!(name: 'Russ Rob', age: 26)
    @team_2.players.create!(name: 'Russel Ron', age: 24)
    @team_3.players.create!(name: 'Rel Roinson', age: 16)
    @team_3.players.create!(name: 'Rus Robon', age: 20)


    visit teams_path
  end

  it 'can display the nicknames of all teams' do
    ecpect(page).to have_content(@team_1.nickname)
    ecpect(page).to have_content(@team_2.nickname)
    ecpect(page).to have_content(@team_3.nickname)
  end
  it 'can display the average age of its players' do
    expect(page).to have_content('Team Average Age: 20')
    expect(page).to have_content('Team Average Age: 25')
    expect(page).to have_content('Team Average Age: 18')
  end

  it 'can sort the teams by their average age highest to lowest' do
    expect(@team_2).to appear_before(@team_1)
    expect(@team_1).to appear_before(@team_3)
  end
end
