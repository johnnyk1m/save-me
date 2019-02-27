class Contact < ApplicationRecord
  # validates :first_name,  presence: true
  # validates :last_name,   presence: true
  # validates :mobile,   presence: true

  belongs_to :user

  def contact_full_name
    "#{first_name} #{last_name}"
  end

end
