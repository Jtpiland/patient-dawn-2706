# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
