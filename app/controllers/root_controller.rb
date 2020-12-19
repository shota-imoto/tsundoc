class RootController < ApplicationController
  def index
    if user_signed_in?
      @tags = current_user.get_associated_objects(params[:tag_type] || "BookTag")
    else
      @user = User.new
    end
  end
end
