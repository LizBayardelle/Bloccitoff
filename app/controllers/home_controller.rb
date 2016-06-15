class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @lists = List.all
    @items = Item.all
    if current_user
        @my_lists = current_user.lists
        @lists_not_by_me = @lists.where.not(user_id: current_user)
        @shared_lists = @lists_not_by_me.where(shared_with: current_user.email)

        @my_items = current_user.items
        @top_items = @my_items.limit(4).order(created_at: :desc)
        @items_delegated_by = @my_items.where.not(delegated_to: "")
        @items_not_by_me = @items.where.not(user_id: current_user)
        @items_delegated_to = @items_not_by_me.where(:delegated_to == current_user.email)
        @top_items_delegated_by = @items_delegated_by.limit(4)
        @top_items_delegated_to = @items_delegated_to.limit(4)
    end
  end
end
