class Item < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :code, :presence => true, :uniqueness => true

  has_many :inventory_items

  def to_s
    self.code
  end

  def to_x
    self.price
  end
end
