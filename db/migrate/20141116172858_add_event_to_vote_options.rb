class AddEventToVoteOptions < ActiveRecord::Migration
  def change
    add_reference :vote_options, :event, index: true
  end
end
