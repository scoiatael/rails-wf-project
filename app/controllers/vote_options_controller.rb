class VoteOptionsController < ApplicationController
  before_action :set_vote_option, only: [:show, :edit, :update, :destroy]
  before_action :check_user

  respond_to :html

  def index
    @vote_options = VoteOption.all
    respond_with(@vote_options)
  end

  def show
    respond_with(@vote_option)
  end

  def new
    @vote_option = VoteOption.new
    respond_with(@vote_option)
  end

  def edit
  end

  def create
    @vote_option = VoteOption.new(vote_option_params)
    @vote_option.save
    respond_with(@vote_option)
  end

  def update
    @vote_option.update(vote_option_params)
    respond_with(@vote_option)
  end

  def destroy
    @vote_option.destroy
    respond_with(@vote_option)
  end

  private
    def set_vote_option
      @vote_option = VoteOption.find(params[:id])
    end

    def vote_option_params
      params.require(:vote_option).permit(:vote_id, :movie_id, :count)
    end
end
