class UsersController < ApplicationController
  before_filter :user_is_current_user

  def show
    @user = User.find(params[:id])
    @lists = current_user.lists
    @items = current_user.items
    @shared_lists = @lists.where(:shared_with == current_user.id)
    @items_delegated_by = @items.where.not(delegated_to: "")
    @items_delegated_to = @items.where(:delegated_to == current_user.email)
  end

  def user_is_current_user
    unless current_user.id == params[:user_id]
      flash[:notice] = "Sorry, you can only look at your own lists."
      redirect_to root_path
    end
  end
end
