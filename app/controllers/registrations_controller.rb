class RegistrationsController < Devise::RegistrationsController

  def new
    @id_hash = invitation_params['invitation']
    super
  end

  def create
    super
    # check invited_by param
    # check invitations for that email
    # set user.user to whoever created that invite if applicable
  end

  private
  def resource_params
    params.require('user').permit :email, :password, :password_confirmation, :id
  end

  def invitation_params
    params.permit('invitation')
  end

end
