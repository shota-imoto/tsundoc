class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    if @tag = Tag.factory(tag_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :type).merge(user_id: current_user.id)
  end
end

