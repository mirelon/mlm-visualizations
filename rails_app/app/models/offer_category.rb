class OfferCategory < ApplicationRecord
  belongs_to :offer
  belongs_to :category
end
