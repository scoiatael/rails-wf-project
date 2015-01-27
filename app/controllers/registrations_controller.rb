class RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super do |user|
      InvitationHelper::remove_invalid!
      matching_invitations = InvitationHelper::find_for_hash(invited_by) + InvitationHelper::find_for_email(user.email)
      invitation = matching_invitations.first
      if invitation
        user.user = invitation.user
        user.save
        matching_invitations.each { |i| i.destroy }
      else
        Notifier.new_user(user).deliver
      end
    end
  end

  private
  def resource_params
    params.require('user').permit :email, :password, :password_confirmation, :id
  end

  def invited_by
    params.permit('invited_by')['invited_by']
  end

end
