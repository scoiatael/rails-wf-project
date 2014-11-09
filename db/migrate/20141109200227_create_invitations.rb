class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :hash
      t.date :expiresAt

      t.timestamps
    end
    add_index :invitations, :hash
  end
end
