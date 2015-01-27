class InvitationController < ApplicationController
  before_action :check_user

  def index
    InvitationHelper::remove_invalid!
  end


  def generate_link
    invitation = Invitation.create user: current_user
    render plain: "#{InvitationHelper::join_url}?invitation=#{invitation.id_hash}"
  end

  def for_email
    email = email_params['email']
    Invitation.new(user: current_user).for_email!(email).save!
    Notifier.been_invited(email, by: current_user).deliver
    render plain: "OK"
  end

  private
  def email_params
    params.permit(:email)
  end
end
