class Program < ApplicationRecord
  has_many :contracts
  has_many :program_rewards_from, class_name: 'ProgramReward', inverse_of: :program
  has_many :program_rewards_to, class_name: 'ProgramReward', inverse_of: :target_program

  def is_partner
    partner_offers_max_count > 0
  end
end
