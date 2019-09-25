class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :create, :update]
  before_action :load_object, only: [:edit, :destroy, :update, :show]

  def index
    if params[:keyword].present?
      @items = Item.ransack(title_or_description_cont: params[:keyword]).result(distinct: true)
      respond_to do |format|
        format.js
      end
    else
      @items = Item.all
    end

  end

  def edit
  end

  def destroy
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.user = current_user
    item.save
    redirect_to root_path
  end

  def update
  end

  def show
  end

  private

  def load_object
    @item = Item.find params[:id]
  end

  def item_params
    params.require(:item).permit(:title, :description, :image)
  end

end
