class VoteOption < ActiveRecord::Base
  belongs_to :vote
  belongs_to :movie
end
