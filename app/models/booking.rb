class Booking < ApplicationRecord
  belongs_to :occasion
  belongs_to :user, class_name: "User", foreign_key: "escort_id"
  belongs_to :user, class_name: "User", foreign_key: "renter_id"

  has_many :reviews
end
