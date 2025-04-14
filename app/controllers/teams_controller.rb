class TeamsController < ApplicationController
  def index
    teams = Team.all
    render json: teams.to_json(include: :users)
  end

  def create
    team = Team.new(team_params)
    if team.save
      render json: team, status: :created
    else
      render json: { errors: team.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add_user
    team = Team.find(params[:id])
    user = User.find(params[:user_id])

    if team.users << user
      render json: { message: "User added to team successfully." }
    else
      render json: { error: "Failed to add user." }, status: :unprocessable_entity
    end
  end

  def remove_user
    team = Team.find(params[:id])
    user = User.find(params[:user_id])

    if team.users.delete(user)
      render json: { message: "User removed from team successfully." }
    else
      render json: { error: "Failed to remove user." }, status: :unprocessable_entity
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end