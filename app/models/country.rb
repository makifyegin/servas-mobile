class Country < ApplicationRecord
  belongs_to :group, optional: true
  has_many :cities, dependent: :restrict_with_error
  has_many :users, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: true
end
