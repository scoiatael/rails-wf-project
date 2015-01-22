class VotesController < ApplicationController
  before_action :check_user
  before_action :set_vote, only: [:up, :down]

  def index
  end

  def up
    @vote.upvote_from current_user
    render plain: @vote.sum_of_votes
  end

  def down
    @vote.downvote_from current_user
    render plain: @vote.sum_of_votes
  end

  private
    def set_vote
      @vote = VoteOption.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:id)
    end
end
