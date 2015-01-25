require 'bcrypt'
require 'date'
require 'cgi'

class Invitation < ActiveRecord::Base
  belongs_to :user
  before_create :set_expiration_date, :set_hash

  def self.id_hash(user, email=nil)
    base = email if email
    base ||= user.id.to_s + Date.today.to_datetime.to_s
    BCrypt::Password.create(base).to_s
  end

  def is_valid?
    expiresAt > Date.today
  end

  def is_invalid?
    not is_valid?
  end

  def for_email!(email)
    self.id_hash = Invitation::id_hash(self.user, email)
    self
  end

  private
  def set_hash
    self.id_hash ||= Invitation::id_hash(self.user)
  end

  def set_expiration_date
    self.expiresAt = Date.today + 5
  end

end
