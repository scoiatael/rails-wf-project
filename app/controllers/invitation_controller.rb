class InvitationController < ApplicationController
  before_action :check_user

  def index
    InvitationHelper::remove_invalid!
  end


  def generate_link
    invitation = Invitation.create user: current_user

    host = request.host_with_port
    link = "https://#{host}#{new_user_registration_path}?invitation=#{invitation.id_hash}"
    # change to current host from devise default mailer
    render plain: link
  end

  def for_email
    Invitation.new(user: current_user).for_email!(email_params['email']).save!
    # send mail notifying them
    render plain: "OK"
  end

  private
  def email_params
    params.permit(:email)
  end
end
