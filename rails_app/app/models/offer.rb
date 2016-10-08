class Offer < ApplicationRecord
  belongs_to :user
  has_many :offer_categories
  has_many :categories, through: :offer_categories
  has_many :purchases
end
