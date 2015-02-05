class UsersController < ApplicationController
  before_action :check_admin

  def index
  end

  def show
    @user = User.find id_param
  end

  def destroy
    user = User.find(id_param)
    case
      when user == current_user
        flash[:error] = "Cannot destroy youself!"
        redirect_to user_path(id_param)
      when user.admin?
        flash[:error] = "Cannot destroy fellow admin!"
        redirect_to user_path(id_param)
      else
        @user = User.destroy id_param
    end
  end

  def update
    @query = query_param.to_sym
    @user = User.find(id_param).tap do |user|
      case @query
      when :approve
        user.user = current_user
      when :promote
        user.role = 'admin'
      end
      user.save!
    end
  end

  private

  def id_param
    params.require(:id)
  end

  def query_param
    params.permit(:query)[:query] || 'approve'
  end
end
