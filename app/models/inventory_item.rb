class InventoryItem < ActiveRecord::Base
  # item_id as a foriegn key to items
  belongs_to :item

  has_many :inventory_transactions

  validates :quantity, :presence => true, :numericality => true

  def to_s
    self.item.name
  end

  def total
    self.item.price * self.quantity
  end
end
