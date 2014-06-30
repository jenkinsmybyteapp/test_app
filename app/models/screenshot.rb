class Screenshot < ActiveRecord::Base
  belongs_to :ticket
  has_attached_file :image, :styles => { thumb: '100x100' }
  validates_attachment_content_type :screenshot, :content_type => /\Aimage\/.*\Z/
end
