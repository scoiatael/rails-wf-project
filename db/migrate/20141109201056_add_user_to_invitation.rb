class AddUserToInvitation < ActiveRecord::Migration
  def change
    add_reference :invitations, :user, index: true
  end
end
