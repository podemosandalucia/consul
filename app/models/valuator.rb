class Valuator < ActiveRecord::Base
  belongs_to :user, touch: true
  delegate :name, :email, to: :user

  has_many :valuation_assignments, dependent: :destroy
  has_many :spending_proposals, through: :valuation_assignments

  validates :user_id, presence: true, uniqueness: true
end
