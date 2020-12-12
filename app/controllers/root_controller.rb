class RootController < ApplicationController
  def index
    if user_signed_in?
      tsundoc_list = current_user.tsundoc_list
      @tsundocs = tsundoc_list.gets_tsundocs_of(params[:tsundocable_type] || "Book")
    else
      @user = User.new
    end
  end
end
