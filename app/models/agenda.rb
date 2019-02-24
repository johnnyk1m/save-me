class Agenda < ApplicationRecord
  validates :title,  presence: true

  belongs_to :destin
end
