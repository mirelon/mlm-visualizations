class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :program
  has_many :payments
  has_many :rewards
  has_many :purchases, as: :contractable
  has_many :fees
end
