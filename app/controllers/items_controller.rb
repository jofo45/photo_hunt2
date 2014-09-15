class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :show, :update]

  def index
    # @items = Item.search_for(params[:q])
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: "Fashion Item was created!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @item.update item_params
      redirect_to @item, notice: "Fashion Item was updated!"
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require('item').permit(:name)
  end
end
