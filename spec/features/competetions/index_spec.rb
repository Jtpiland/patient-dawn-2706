require 'rails_helper'

RSpec.describe 'Competetions Index Page' do
  before :each do
    @competition_1 = Competition.create!(name: 'March Madness', location: 'San Antonio', sport: 'basketball')
    @competition_1 = Competition.create!(name: 'NBA Playoffs', location: 'The Bubble', sport: 'basketball')

    visit competitions_path
  end

  it 'displays all competitions with their respective attributes' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.name)
  end

  it 'can link to a competitions show page' do
    click_link "#{@competition_1.name}"

    expect(current_path).to eq(competition_path(@competition_1))
  end
end
