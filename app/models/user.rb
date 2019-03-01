class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :contacts, dependent: :destroy
  has_one :car, dependent: :destroy
  has_one :destin, dependent: :destroy
  

  # def create_destin
    # the rest of the destination info will be nil
    #   but the user_id will be associated with the destination
  #   Destin.create(user_id: self.id)
  # end

end
