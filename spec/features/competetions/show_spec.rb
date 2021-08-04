require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  before :each do
    @competition_1 = Competition.create!(name: 'March Madness', location: 'San Antonio', sport: 'basketball')
    @competition_2 = Competition.create!(name: 'NBA Playoffs', location: 'The Bubble', sport: 'basketball')

    @team_1 = Team.create!(hometown: 'Lawrence', nickname: 'Jayhawks')
    @team_2 = Team.create!(hometown: 'Austin', nickname: 'Longhorns')
    @team_3 = Team.create!(hometown: 'Norman', nickname: 'Sooners')

    @team_1.players.create!(name: 'Billy Bigshoes', age: 18)
    @team_1.players.create!(name: 'Julius Wright', age: 22)
    @team_1.players.create!(name: 'Russel Robinson', age: 20)

    CompetitionTeam.create!(competition: @competition_1, team: @team_1)
    CompetitionTeam.create!(competition: @competition_1, team: @team_2)

    visit competition_path(@competition_1)
  end

  it 'displays the attributes of a particular competition' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.location)
    expect(page).to have_content(@competition_1.sport)
  end

  it 'displays the nickname and hometown of all teams in the competition' do
    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to_not have_content(@team_3.hometown)
    expect(page).to_not have_content(@team_3.nickname)
  end

  it 'displays the average age of all the players in the competition' do
    require "pry"; binding.pry
    expect(page).to have_content('Average Age of Player in Competiton: 20')
  end
end
