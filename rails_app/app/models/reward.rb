class Reward < ApplicationRecord
  belongs_to :rewardable, polymorphic: true
  belongs_to :contract
end
