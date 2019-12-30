class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :event_attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_attendances, source: :attendee

  has_many :event_invitations, foreign_key: "invited_event_id"
  has_many :invitees, through: :event_invitations, source: :invitee

  def self.upcoming_events
    where("date > ?", Time.zone.now)
  end

  def self.past_events
    where("date < ?", Time.zone.now)
  end

  def upcoming_event?
    self.date > Time.zone.now
  end
end
