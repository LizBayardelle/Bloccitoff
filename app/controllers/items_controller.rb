class ItemssController < ApplicationController
  before_action :authenticate_user!


  def index
      @list = List.friendly.find(params[:list_id])
      @item = Item.new
      @items = Items.all
  end

  def new
    @item = Item.new
  end

  def create
    @list = List.friendly.find(params[:list_id])
    item = @list.items.new(item_params)
    item.user = current_user

    if score.save
      flash[:notice] = "Item saved successfully."
      redirect_to [@list]
    else
      flash[:alert] = "Item failed to save."
      redirect_to [@list]
    end
  end

  def destroy
    @list = List.friendly.find(params[:list_id])
    item = @list.items.find(params[:id])

    if score.destroy
      flash[:notice] = "Item was deleted successfully."
      redirect_to [@list]
    else
      flash[:alert] = "Item couldn't be deleted. Try again."
      redirect_to [@list]
    end
  end

  private

  def item_params
      params.require(:item).permit(:name, :delegated_to, :days_til_expire)
  end
end
