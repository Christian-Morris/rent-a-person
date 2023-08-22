class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :availabilities
  has_many :user_occasions
  has_many :occasions, through: :user_occasions
  # This allows us to check the bookings the user has booked (not those they have been booked to escort on)
  has_many :bookings, class_name: "Booking", foreign_key: "renter_id"
  # "user.engagements" will display bookings that they are booked to escort on.
  has_many :engagements, class_name: "Booking", foreign_key: "escort_id"
  has_many :reviews, class_name: "Review", foreign_key: "escort_id"
end
