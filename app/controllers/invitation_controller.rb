class InvitationController < ApplicationController
  before_action :check_user

  def index
    invitation = current_user.invitation
    unless invitation and invitation.is_valid?
      if invitation
        invitation.delete
      end
      invitation = current_user.invitation = Invitation.create user: current_user
      current_user.save
    end
    host = request.host_with_port
    @link = "https://#{host}#{new_user_registration_path}?invitation=#{invitation.id_hash}"
  end
end
