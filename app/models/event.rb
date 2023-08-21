class Event < ApplicationRecord

  validates :name, :description, :start_date,:end_date,:city, presence: true
  validate :end_date_after_start_date
  
  belongs_to :user, class_name: 'User'

  after_create :set_email_reminder

  def set_email_reminder
    EventReminderJob.set(wait: 5.minutes).perform_later(self.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name description start_date end_date city]
  end

  def self.ransackable_associations(auth_object = nil)
    ['user'] 
  end
  
  #it's custom validation for start date and date
  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    errors.add(:end_date, "must be after start date") if end_date < start_date
  end
end
