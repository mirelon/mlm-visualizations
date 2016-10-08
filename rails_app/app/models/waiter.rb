class Waiter < ApplicationRecord
  belongs_to :user # partner, u koho pracuje
  has_many :purchases
end
