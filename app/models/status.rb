class Status < ActiveRecord::Base
  validates :name, presence: true
  has_one :ticket

  CLOSED_STATUSES = ['Cancelled', 'Completed']
  OPEN_STATUSES = ['Waiting for Staff Response', 'Waiting for Customer']
  HOLD_STATUSES = ['On Hold']

  scope :closed, -> { where('name IN (?)', CLOSED_STATUSES) }
  scope :open, -> { where('name IN (?)', OPEN_STATUSES) }
  scope :hold, -> { where('name IN (?)', HOLD_STATUSES) }
end
