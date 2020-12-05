# create_table "tsundocs", force: :cascade do |t|
#   t.integer "tsundoc_list_id", null: false
#   t.integer "material_id", null: false
#   t.integer "status", null: false, default: 0
#   t.integer "priority_pt", null: false, default: 0
#   t.boolean "secret", null: :false, default: :false
#   t.timestamps
# end

class TsundocsController < ApplicationController
  def new
    @tsundoc = Tsundoc.new
  end

  def create
    ApplicationRecord.transaction do
      @tsundoc_product = Material.factory(params[:kind], book_params)
      @tsundoc = Tsundoc.create(tsundoc_params)
    end
    redirect_to root_path
  end

  private

  def tsundoc_params
    params.permit(:priority_pt, :secret).merge(tsundoc_list_id: current_user.tsundoc_list.id, material_id: @tsundoc_product.material_id)
  end

  def book_params
    params.permit(:title, :author)
  end
end
