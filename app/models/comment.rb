class Comment < ApplicationRecord
  belongs_to :user , class_name: 'User'
  belongs_to :event, class_name: 'Event'

  has_one_attached :image

end
