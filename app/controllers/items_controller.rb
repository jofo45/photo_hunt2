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
    params.require(:item).permit(:name, :classification, :brand, :url_link, :product_id, :image, :price_web)
  end

    # def apartment_params
    #   params.require(:apartment).permit(:name, :price, :address, :occupied)

    # t.string   "name"
    # t.string   "classification"
    # t.string   "brand"
    # t.string   "url_link"
    # t.string   "product_id"
    # t.string   "image"
    # t.integer  "price_web"
    # t.datetime "created_at"
    # t.datetime "updated_at"

end
