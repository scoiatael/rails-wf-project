class VoteOption < ActiveRecord::Base
  belongs_to :event
  belongs_to :movie

  acts_as_votable

  def sum_of_votes
    self.votes_for.up.size - self.votes_for.down.size
  end
end
