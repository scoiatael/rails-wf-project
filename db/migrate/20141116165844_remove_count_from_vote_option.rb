class RemoveCountFromVoteOption < ActiveRecord::Migration
  def change
    remove_column :vote_options, :count
  end
end
