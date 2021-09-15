class Item < ApplicationRecord
   belongs_to :ganre
   attachment :image
   
end
