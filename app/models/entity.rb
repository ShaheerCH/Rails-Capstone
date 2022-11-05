class Entity < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy
  has_many :groups, through: :categories

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
