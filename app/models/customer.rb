class Customer < ApplicationRecord

enum is_active: { mukou: false, yuukou: true }


   def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
   end

   has_many :addresses, dependent: :destroy
   has_many :cart_items, dependent: :destroy
   has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
