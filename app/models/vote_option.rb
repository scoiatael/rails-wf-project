class VoteOption < ActiveRecord::Base
  belongs_to :vote
  belongs_to :event
  belongs_to :movie
end
