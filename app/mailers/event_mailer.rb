class EventMailer < ApplicationMailer
  def event_reminder(event)
    @event = event
    
    mail to: @event&.user&.email, 
    subject: 'Event Reminder'
  end
end
