class User < ApplicationRecord
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :phone, uniqueness: true

  def full_name
  	"#{last_name} #{first_name}"
  end
  	
end
