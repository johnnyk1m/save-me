class Destin < ApplicationRecord
  validates :start_date,  presence: true
  validates :end_date,   presence: true
  validates :alarm_date,  presence: true

  belongs_to :user
end
