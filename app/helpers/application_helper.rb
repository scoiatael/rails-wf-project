module ApplicationHelper
  def check_admin
    unless current_user.try :admin?
      flash[:error] = "Only admin can do that!"
      redirect_to root_path
    end
  end
end
