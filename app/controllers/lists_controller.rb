class ListsController < ApplicationController
  def index
    @all_lists = List.all
    @list = List.new
    @lists = current_user.lists
  end

  def show
    @list = List.friendly.find(params[:id])
    @item = Item.new
    @items = @list.items.all
  end

  def new
    @list = List.new
    @list.user_id = current_user
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      flash[:notice] = "Your list was saved successfully."
      redirect_to @list
    else
      flash.now[:alert] = "Error creating list. Please try again."
      render :new
    end
  end

  def edit
    @list = List.friendly.find(params[:id])
    @list.user_id = current_user
  end

  def update
    @list = List.friendly.find(params[:id])

    @list.name = params[:list][:name]
    @list.description = params[:list][:description]
    @list.shared_with = params[:list][:shared_with]
    @list.user = current_user

    if @list.save
       flash[:notice] = "List was updated successfully."
      redirect_to @list
    else
      flash.now[:alert] = "Error saving list. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.friendly.find(params[:id])

    if @list.destroy
      flash[:notice] = "\"#{@list.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the list."
      render :show
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :description, :shared_with, :slug)
  end
end
