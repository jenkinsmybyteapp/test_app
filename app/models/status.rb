class Status < ActiveRecord::Base
  validates :name, presence: true
  has_one :ticket
end
