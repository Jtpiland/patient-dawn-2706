class CompetitionTeamsController < ApplicationController

  def create
    competition = Competition.find(params[:competition_id])
    team = Team.create!(nickname: params[:nickname], hometown: params[:hometown])
    ct = CompetitionTeam.create(competition_id: params[:competition_id], team_id: params[:team_id])

    ct.save
    redirect_to competition_path(competition)
  end
end
