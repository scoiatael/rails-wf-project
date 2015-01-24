module InvitationHelper
  def self.remove_invalid
    Invitation.all.select(&:is_invalid?).each(:destroy)
  end
end
