class Booking < ApplicationRecord
  belongs_to :occasion
  belongs_to :escort, class_name: "User", foreign_key: "escort_id"
  belongs_to :renter, class_name: "User", foreign_key: "renter_id"

  has_many :reviews
end
