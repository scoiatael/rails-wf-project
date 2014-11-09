class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :event, index: true
      t.boolean :closed

      t.timestamps
    end
  end
end
