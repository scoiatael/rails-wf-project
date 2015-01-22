class RegistrationsController < Devise::RegistrationsController

  def new
    @id_hash = invitation_params['invitation']
    super
  end

  def create
    super
  end

  private
  def resource_params
    params.require('user').permit :email, :password, :password_confirmation, :id
  end

  def invitation_params
    params.permit('invitation')
  end

end
