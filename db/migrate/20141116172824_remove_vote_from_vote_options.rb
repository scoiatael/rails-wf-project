class RemoveVoteFromVoteOptions < ActiveRecord::Migration
  def change
    remove_reference :vote_options, :vote, index: true
  end
end
