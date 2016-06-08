class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lists = current_user.lists
    @items = current_user.items
    @shared_lists = @lists.where(:shared_with == current_user.id)
    @items_delegated_by = @items.where.not(delegated_to: "")
    @items_delegated_to = @items.where(:delegated_to == current_user.email)
  end
end
