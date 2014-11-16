class VoteOption < ActiveRecord::Base
  belongs_to :event
  belongs_to :movie

  acts_as_votable
end
