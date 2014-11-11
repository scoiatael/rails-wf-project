class Event < ActiveRecord::Base
  belongs_to :movie
  has_one :vote
  accepts_nested_attributes_for :vote
  before_create :add_empty_vote

  private
  def add_empty_vote
    self.vote = Vote.create unless self.vote
  end
end
