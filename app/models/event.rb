class Event < ActiveRecord::Base
  belongs_to :movie
  has_many :vote_options
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true

  private
  def add_empty_vote
    self.vote = Vote.create unless self.vote
  end
end
