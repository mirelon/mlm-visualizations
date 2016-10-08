class Fee < ApplicationRecord
  belongs_to :contract
  has_many :rewards, as: :rewardable
end
