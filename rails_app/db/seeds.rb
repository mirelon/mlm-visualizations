# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'DB seed started'

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)

zakladny_clen = Program.create!(name: 'Základný člen', version: 1, price: 3, fee: 1.5, withdrawal_fee: 1.5, counts_to_parent_status: false, can_invite: false, has_early_access: false, partner_offers_max_count: 0)
zlaty_clen = Program.create!(name: 'Zlatý člen', version: 1, price: 6.5, fee: 1.5, withdrawal_fee: 1.5, counts_to_parent_status: true, can_invite: true, has_early_access: false, partner_offers_max_count: 0)
vip_clen = Program.create!(name: 'VIP člen', version: 1, price: 10, fee: 1.5, withdrawal_fee: 1.5, counts_to_parent_status: true, can_invite: false, has_early_access: true, partner_offers_max_count: 0)
zakladny_partner = Program.create!(name: 'Základný partner', version: 1, price: 0, fee: 0, withdrawal_fee: 0, counts_to_parent_status: true, can_invite: true, has_early_access: false, partner_offers_max_count: 7)

zakladny_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 1, to_level: 1, amount: 1.5
zakladny_clen.program_rewards_from.create! target_program: vip_clen, from_level: 1, to_level: 1, amount: 1.5
zlaty_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 1, to_level: 1, amount: 1.5
zlaty_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 2, to_level: 2, amount: 1.0
zlaty_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 3, to_level: 3, amount: 0.5
zlaty_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 4, to_level: 4, amount: 0.3
zlaty_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 5, to_level: 10, amount: 0.1
zlaty_clen.program_rewards_from.create! target_program: vip_clen, from_level: 1, to_level: 1, amount: 1.5
zlaty_clen.program_rewards_from.create! target_program: vip_clen, from_level: 2, to_level: 2, amount: 1.0
zlaty_clen.program_rewards_from.create! target_program: vip_clen, from_level: 3, to_level: 3, amount: 0.5
zlaty_clen.program_rewards_from.create! target_program: vip_clen, from_level: 4, to_level: 4, amount: 0.3
zlaty_clen.program_rewards_from.create! target_program: vip_clen, from_level: 5, to_level: 10, amount: 0.1
vip_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 1, to_level: 1, amount: 1.5
vip_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 2, to_level: 2, amount: 1.0
vip_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 3, to_level: 3, amount: 0.5
vip_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 4, to_level: 4, amount: 0.3
vip_clen.program_rewards_from.create! target_program: zlaty_clen, from_level: 5, to_level: 10, amount: 0.1
vip_clen.program_rewards_from.create! target_program: vip_clen, from_level: 1, to_level: 1, amount: 1.5
vip_clen.program_rewards_from.create! target_program: vip_clen, from_level: 2, to_level: 2, amount: 1.0
vip_clen.program_rewards_from.create! target_program: vip_clen, from_level: 3, to_level: 3, amount: 0.5
vip_clen.program_rewards_from.create! target_program: vip_clen, from_level: 4, to_level: 4, amount: 0.3
vip_clen.program_rewards_from.create! target_program: vip_clen, from_level: 5, to_level: 20, amount: 0.1
vip_clen.program_rewards_from.create! target_program: vip_clen, from_level: 21, to_level: 30, amount: 0.01

puts 'DB seed complete'
