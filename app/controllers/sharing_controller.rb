class SharingController < ApplicationController
  def lists
    @lists = List.all
    @shared_with_me = @lists.where(:shared_with == current_user.email)
    @shared_by_me = current_user.lists.where.not(shared_with: "")
  end

  def tasks
    @lists = List.all
    @list = List.friendly.find(params[:list_id])
    @items = Item.all
    @delegated_to_me = @items.where(:delegated_to == current_user.email)
    @delegated_by_me = current_user.items.where.not(delegated_to: "")
  end
end
