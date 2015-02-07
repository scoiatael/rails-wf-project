class VoteOption < ActiveRecord::Base
  belongs_to :event
  belongs_to :movie

  acts_as_votable

  def sum_of_votes
    self.votes_for.up.size - self.votes_for.down.size
  end

  def upvoted?(user)
    votes_for.up.find_by voter_id: user.id, voter_type: user.class.to_s
  end

  def downvoted?(user)
    votes_for.down.find_by voter_id: user.id, voter_type: user.class.to_s
  end
end
