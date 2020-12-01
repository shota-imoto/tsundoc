class RootController < ApplicationController
  def index
    if user_signed_in?
      @tsundocs = Tsundoc.list_owned_by(current_user)
    else
      @user = User.new
    end
  end
end
