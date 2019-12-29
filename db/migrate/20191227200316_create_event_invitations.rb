class CreateEventInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :event_invitations do |t|
      t.integer :invitee_id
      t.integer :invited_event_id

      t.timestamps
    end
  end
end
