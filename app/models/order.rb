class Order < ApplicationRecord

has_many :order_items, dependent: :destroy
belongs_to :customer
enum payment_type: { credit_card: 0, transfer: 1 }

def  add_tax_price
  (self.price * 1.10).round
end

end
