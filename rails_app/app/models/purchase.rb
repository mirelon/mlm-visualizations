class Purchase < ApplicationRecord
  belongs_to :offer
  belongs_to :contractable, polymorphic: true
  belongs_to :waiter
  has_many :rewards, as: :rewardable
end
