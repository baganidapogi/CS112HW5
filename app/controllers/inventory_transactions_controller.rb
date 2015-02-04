class InventoryTransactionsController < ApplicationController

  def index
    @inventory_transactions = InventoryTransaction.all

    render :template => "inventory_transactions/index"
  end

  def new
    @inventory_transaction = InventoryTransaction.new

    render :template => "inventory_transactions/new"
  end

  def create
    @inventory_transaction = InventoryTransaction.new(inventory_transaction_params)

    # After saving, update the attached inventory_item's quantity
    if @inventory_transaction.save
      quantity = @inventory_transaction.quantity
      transaction_type = @inventory_transaction.transaction_type

      if transaction_type == "in"
        new_quantity = @inventory_transaction.inventory_item.quantity + quantity
        @inventory_transaction.inventory_item.update(:quantity => new_quantity)
      elsif transaction_type == "out"
        new_quantity = @inventory_transaction.inventory_item.quantity - quantity
        @inventory_transaction.inventory_item.update(:quantity => new_quantity)
      end

      redirect_to inventory_items_path
    else
      render :template => "inventory_transactions/new"
    end
  end

  def inventory_transaction_params
    params.require(:inventory_transaction).permit!
  end
end
