class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  def self.sort_by_avg_age
    order(self.players.average_age)
  end
end
