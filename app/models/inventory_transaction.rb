class InventoryTransaction < ActiveRecord::Base
  TRANSACTION_TYPES = ["in", "out"]

  belongs_to :inventory_item

  validates :quantity, :presence => true, :numericality => true
  validates :transacted_at, :presence => true
  validates :transaction_type, :presence => true, :inclusion => { :in => TRANSACTION_TYPES }

def to_x
     self.inventory_item.to_s
end
  validate :cannot_be_greater_than_or_equal_to_current_inventory_quantity

  def cannot_be_greater_than_or_equal_to_current_inventory_quantity
    if self.quantity > self.inventory_item.quantity and self.transaction_type == "out"
      errors.add(:quantity, "Transaction quantity exceeds the availble stock")
    end
  end

  validate :transacted_at_cannot_be_less_than_current_date

  def transacted_at_cannot_be_less_than_current_date
    if self.transacted_at < Time.now
      errors.add(:transacted_at, "Cannot be less than current date")
    end
  end
end
