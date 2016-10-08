class ProgramReward < ApplicationRecord
  belongs_to :program
  belongs_to :target_program, class_name: 'Program'
end
