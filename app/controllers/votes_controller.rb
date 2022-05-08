class VotesController < ApplicationController
  #先處理index
  def index
    @votes = Vote.all
  end

  def new
    @votes = Vote.new
  end

  def create
    @votes = Vote.new(vote_params)
    
    if @votes.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @votes = Vote.find(params["id"])
  end

  def destroy
    @votes = Vote.find(params["id"])
    @votes.destroy
    redirect_to root_path
  end

  private

  def vote_params
    params.require(:vote).permit(
      :name, :party, :age, :politics, :votes
    )
  end
end
