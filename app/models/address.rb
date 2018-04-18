class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postcode, length: { maximum: 7 }
  
end
