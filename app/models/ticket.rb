class Ticket < ActiveRecord::Base
  before_create :generate_reference
  has_many :screenshots

  validates :body, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

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
end
