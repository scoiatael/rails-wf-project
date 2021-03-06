class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :invitation
  belongs_to :user
  has_many :referrals, :foreign_key => 'user_id', :class_name => "User"

  def admin?
    self.role == 'admin'
  end

  def approved?
    not self.user.nil?
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end

  def self.statistics
    %w(
      email
      sign_in_count
      current_sign_in_at
      last_sign_in_at
      last_sign_in_ip
      current_sign_in_ip
      created_at
    )
  end
end
