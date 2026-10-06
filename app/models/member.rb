class Member < ApplicationRecord
  belongs_to :region
  validates :hydra_sub, presence: true, uniqueness: true
  validates :name, presence: true
end
