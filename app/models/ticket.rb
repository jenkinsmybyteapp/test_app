class Ticket < ActiveRecord::Base
  validates :body, presence: true
  before_create :generate_reference

  private
  def generate_reference
    reference = random_str('A'..'Z') + random_str('0'..'9') +
                random_str('A'..'Z') + random_str('0'..'9') +
                random_str('A'..'Z')
    self.reference = reference
  end

  def random_str(range, length = 3)
    return '' if length < 1 || range.count < length

    range.to_a.shuffle[0, length].join
  end
end
