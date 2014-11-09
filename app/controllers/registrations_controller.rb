class RegistrationsController < Devise::RegistrationsController

  def create
    self.resource = User.new resource_params
    flash.now.alert = "You haven't been invited!"
    render 'new'
  end

  private
  def resource_params
    params.require('user').permit :email, :password, :password_confirmation, :id
  end

  def invitation_params
    params.require('invitation').permit 'hash'
  end

end
