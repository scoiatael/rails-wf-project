class Vote < ActiveRecord::Base
  belongs_to :event
  has_many :vote_options
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true

  before_create :ensure_at_least_one_option


  private

  def ensure_at_least_one_option
    self.vote_options.push VoteOption.create if self.vote_options.empty?
  end
end
