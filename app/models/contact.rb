class Contact < ApplicationRecord
  # validates :first_name,  presence: true
  # validates :last_name,   presence: true
  # validates :mobile,   presence: true

  belongs_to :user
end
