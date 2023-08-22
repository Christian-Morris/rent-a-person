class Occasion < ApplicationRecord
  has_many :user_occasions
  has_many :users, through: :user_occasions
end
