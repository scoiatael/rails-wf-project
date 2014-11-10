class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :id_hash
      t.date :expiresAt

      t.timestamps
    end
    add_index :invitations, :id_hash
  end
end
