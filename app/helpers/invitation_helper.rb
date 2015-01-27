module InvitationHelper
  class << self
    def remove_invalid!
      Invitation.all.select(&:is_invalid?).each(&:destroy)
    end

    def find_for_email email
      Invitation.all.select { |i| BCrypt::Password.new(i.id_hash) == email } || []
    end

    def find_for_hash hash
      Invitation.find_by(id_hash: hash) || []
    end
  end
end
