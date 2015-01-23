class AddApprovedToUser < ActiveRecord::Migration
  def change
    add_reference :users, :user, index: true, null: true
  end
end
