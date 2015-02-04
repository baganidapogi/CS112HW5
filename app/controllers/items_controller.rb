class ItemsController < ApplicationController

  def index
    @items = Item.all

    render :template => "items/index"
  end

  def show
    @item = Item.find(params[:id])

    render :template => "items/show.html.erb"
  end

  def new
    @item = Item.new

    render :template => "items/new"
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to items_path
    else
      render :template => "items/new"
    end
  end

  def edit
    @item = Item.find(params[:id])

    render :template => "items/edit"
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to items_path
    else
      render :template => "items/edit"
    end
  end

  def destroy
    Item.find(params[:id]).destroy!
    redirect_to items_path
  end
  
  def item_params
    params.require(:item).permit!
  end
end
