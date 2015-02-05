class UserController < ApplicationController

  def users
  end

  def user
    @user = User.find(params[:id])
  end
end
