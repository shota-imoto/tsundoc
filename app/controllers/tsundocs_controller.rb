# create_table "tsundocs", force: :cascade do |t|
#   t.integer "tsundoc_list_id", null: false
#   t.integer "material_id", null: false
#   t.integer "status", null: false, default: 0
#   t.integer "priority_pt", null: false, default: 0
#   t.boolean "private", null: :false, default: :false
#   t.timestamps
# end

class TsundocsController < ApplicationController
  def new
    @tsundoc = Tsundoc.new
  end

  def create
    @material = Material.create
    @book = Book.create(book_params)
    @tsundoc = Tsundoc.create(tsundoc_params)
  end


  private

  def tsundoc_params
    params.permit(:priority_pt, :private).merge(tsundoc_list_id: current_user.tsundoc_list.id, material_id: @material.id)
  end

  def book_params
    params.permit(:title, :author).merge(material_id: @material.id)
  end
end
