class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_ancestry
  acts_as_avatarable
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :contracts
  has_many :payments, through: :contracts
  has_many :offers # as partner
  has_many :invitation_cards, class_name: 'Card', inverse_of: :parent, foreign_key: :parent_id # as partner who issued the card
  has_one :card # as card owner
  has_many :waiters # as partner
  has_many :addresses

  # @return Contract
  def current_contract
    contracts.where('created_at <= ?', Time.now).order('created_at desc').first
  end

  def current_program
    current_contract.try &:program
  end

  def current_program_name
    current_program.try &:name
  end

  # Sum amounts of all direct payments
  def sum_payments
    contracts.sum{ |c| c.payments.sum(&:amount)}
  end

  # As member
  def sum_fees
    contracts.sum{ |c| c.fees.sum(&:total)}
  end

  # As member
  def balance
    sum_payments - sum_fees
  end

  def is_partner
    if current_contract
      current_contract.program.is_partner
    else
      false
    end
  end

end
