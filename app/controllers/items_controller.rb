class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @list = List.friendly.find(params[:list_id])
    @item = @list.Item.new
    @items = @list.Items.all
  end

  def new
    @list = List.friendly.find(params[:list_id])
    @item = Item.new
  end

  def show
    @list = List.friendly.find(params[:list_id])
    item = Item.find(params[:id])
  end

  def create
    @list = List.friendly.find(params[:list_id])
    @item = @list.items.new(item_params)
    @item.user = current_user
    @new_item = Item.new
    @items = current_user.items

    if @item.save
      flash[:notice] = "Item saved successfully."
    else
      flash[:alert] = "Item failed to save."
    end

    respond_to do |format|
      format.js
    end
  end

  def update
    @list = List.friendly.find(params[:list_id])
    @item = @list.items.find(params[:id])

    @item.name = params[:item][:name]
    @item.delegated_to = params[:item][:delegated_to]
    @item.days_til_expire = params[:item][:days_til_expire]
    @item.completed = params[:item][:completed]
    @item.user = current_user

    if @item.save
      @item.completed = Time.now
      flash[:notice] = "Congratulations!"
      redirect_to @list
    else
      flash.now[:alert] = "Whoops! There was an error checking off item. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.friendly.find(params[:list_id])
    @item = @list.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted successfully."
    else
      flash[:alert] = "Item couldn't be deleted. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
      params.require(:item).permit(:name, :completed, :delegated_to, :days_til_expire)
  end
end
