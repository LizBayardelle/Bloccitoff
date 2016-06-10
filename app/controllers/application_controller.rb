class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_lists

  def set_lists
    if current_user
      @my_lists = current_user.lists
    end
  end

  def after_sign_in_path_for(resource_or_scope)
   home_index_path
  end
end
