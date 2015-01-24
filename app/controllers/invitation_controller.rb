class InvitationController < ApplicationController
  before_action :check_user

  def index
    InvitationHelper::remove_invalid
    current_user.invitation = Invitation.create user: current_user unless current_user.invitation

    invitation = current_user.invitation
    current_user.save
    host = request.host_with_port
    @link = "https://#{host}#{new_user_registration_path}?invitation=#{invitation.id_hash}"
    # change to current host from devise default mailer
  end

  def create
    # create invitation for given email
    # send mail notifying them
  end
end
