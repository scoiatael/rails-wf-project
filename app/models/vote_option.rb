class VoteOption < ActiveRecord::Base
  belongs_to :vote
  belongs_to :movie
  before_create :clear_count

  def increment_count
    self.count += 1
  end

  private
  def clear_count
    self.count = 0
  end
end
