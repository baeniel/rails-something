class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :destroy, :create, :update]
  before_action :load_object, only: [:edit, :destroy, :update, :show]

  def index
    if params[:keyword].present?
      @items = Item.ransack(title_or_description_cont: params[:keyword]).result(distinct: true).page(params[:page]).per(4)
    else
      @items = Item.page(params[:page]).per(4)
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
    @comment = Comment.new
    @comments = @item.comments
  end

  private

  def load_object
    @item = Item.find params[:id]
  end

  def item_params
    params.require(:item).permit(:title, :description, :image)
  end

end
