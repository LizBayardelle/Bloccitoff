class HomeController < ApplicationController
  def index
    @lists = List.all
    @items = Item.all
    @my_lists = current_user.lists
    @my_items = current_user.items
    @top_items = Item.limit(4).order(created_at: :desc)
  end
end
