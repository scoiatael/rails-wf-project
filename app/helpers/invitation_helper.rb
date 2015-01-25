module InvitationHelper
  def self.remove_invalid
    Invitation.all.select(&:is_invalid?).each(&:destroy)
  end

  def self.find_for(email)
    Invitation.all.select { |i| BCrypt::Password.new(i.id_hash) == email }
  end
end
