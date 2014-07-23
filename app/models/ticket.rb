class Ticket < ActiveRecord::Base
  before_validation :add_default_status
  before_create :generate_reference
  has_many :screenshots
  belongs_to :department
  belongs_to :status
  belongs_to :user

  validates :body, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :department, presence: true
  validates :status, presence: true

  DEFAULT_STATUS = 'Waiting for Staff Response'

  scope :closed, -> { joins(:status).merge(Status.closed) }
  scope :open, -> { joins(:status).merge(Status.open) }
  scope :hold, -> { joins(:status).merge(Status.hold) }

  def to_param
    reference
  end

  private
  def generate_reference
    reference = [ random_str('A'..'Z'), random_str('0'..'9'),
                  random_str('A'..'Z'), random_str('0'..'9'),
                  random_str('A'..'Z') ].join('-')
    self.reference = reference
  end

  def random_str(range, length = 3)
    return '' if length < 1 || range.count < length

    range.to_a.shuffle[0, length].join()
  end

  def add_default_status
    self.status = Status.where(name: DEFAULT_STATUS ).first
  end
end
