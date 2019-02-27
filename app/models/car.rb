class Car < ApplicationRecord
  # validates :make,  presence: true
  # validates :color,  presence: true

  belongs_to :user
end
