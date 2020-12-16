class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def tag_params
    params.permit(:name, :type).merge(user_id: current_user.id)
  end
end

