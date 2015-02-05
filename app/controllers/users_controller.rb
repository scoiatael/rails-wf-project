class UsersController < ApplicationController
  before_action :check_admin

  def index
  end

  def show
    @user = User.find id_param
  end

  def destroy
    @user = User.destroy id_param
  end

  private

  def id_param
    params.require(:id)
  end
end
