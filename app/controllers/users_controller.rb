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

  def update
    @user = User.find(id_param).tap { |user| user.user = current_user; user.save! }
  end

  private

  def id_param
    params.require(:id)
  end
end
