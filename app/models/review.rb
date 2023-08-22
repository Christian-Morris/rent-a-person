class Review < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "escort_id"
  belongs_to :user, class_name: "User", foreign_key: "renter_id"
  belongs_to :booking
end
