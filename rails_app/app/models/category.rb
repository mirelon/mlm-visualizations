class Category < ApplicationRecord
  has_ancestry

  has_many :user_categories
  has_many :users, through: :user_categories
  has_many :offer_categories
  has_many :offers, through: :offer_categories
end
