class Country < ApplicationRecord
  belongs_to :group, optional: true
  has_many :regions, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: true
end
