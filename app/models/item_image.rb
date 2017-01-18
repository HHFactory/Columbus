# entity of itemImage

class ItemImage < ActiveRecord::Base
  belongs_to :item
end
