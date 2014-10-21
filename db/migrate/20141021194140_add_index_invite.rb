class AddIndexInvite < ActiveRecord::Migration
  def change
    add_index :invites, :pantry_id
    add_index :invites, :sender_id
    add_index :invites, :recipient_id
  end
end
