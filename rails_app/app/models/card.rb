class Card < ApplicationRecord
  belongs_to :user
  belongs_to :parent, foreign_key: :parent_id, class_name: 'User', inverse_of: :invitation_cards
  has_many :purchases, as: :contractable
end
