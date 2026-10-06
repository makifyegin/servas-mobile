class Region < ApplicationRecord
  belongs_to :country
  has_many :members, dependent: :restrict_with_error
end
