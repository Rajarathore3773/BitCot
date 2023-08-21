class EventReminderJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = Event.find(event_id)
    EventMailer.event_reminder(event).deliver_now
  end
end
