class RegistrationsController < Devise::RegistrationsController

  def new
    @id_hash = invitation_params['invitation']
    super
  end

  def create
    invitation_id = invitation_params['invitation']
    valid_invitation = Invitation.find_by id_hash: invitation_id
    valid_invitation.delete
    unless valid_invitation
      self.resource = User.new resource_params
      flash.now.alert = "You haven't been invited!"
      render 'new'
    else
      super
    end
  end

  private
  def resource_params
    params.require('user').permit :email, :password, :password_confirmation, :id
  end

  def invitation_params
    params.permit('invitation')
  end

end
