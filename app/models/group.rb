class Group < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy
  has_many :entities, through: :categories, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end
