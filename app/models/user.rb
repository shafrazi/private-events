class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  has_many :event_attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :event_attendances, source: :attended_event

  has_many :event_invitations, foreign_key: "invitee_id"
  has_many :invited_events, through: :event_invitations, source: :invited_event

end
