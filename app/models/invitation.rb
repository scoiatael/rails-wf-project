require 'bcrypt'
require 'date'

class Invitation < ActiveRecord::Base
  belongs_to :user
  before_create :set_expiration_date, :set_hash

  def is_valid?
    self.expiresAt < Date.today
  end

  private
  def set_hash
    self.id_hash = BCrypt::Password.create(Date.today.to_datetime.to_s + self.user.id.to_s).to_s.gsub(/[\/?]/, '')
  end
  def set_expiration_date
    self.expiresAt = Date.today + 5
  end
end
