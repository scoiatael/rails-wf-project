class CreateVoteOptions < ActiveRecord::Migration
  def change
    create_table :vote_options do |t|
      t.belongs_to :vote, index: true
      t.belongs_to :movie, index: true
      t.integer :count

      t.timestamps
    end
  end
end
