class AdminController < ApplicationController
  before_action :check_admin

  def index
  end

  def users
  end

  def user
    @user = User.find(params[:id])
  end
end
