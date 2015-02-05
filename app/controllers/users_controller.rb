class UsersController < ApplicationController
  before_action :check_admin

  def index
  end

  def show
    @user = User.find(params[:id])
  end
end
