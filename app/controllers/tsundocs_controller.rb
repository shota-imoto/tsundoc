# create_table "tsundocs", force: :cascade do |t|
#   t.integer "tsundoc_list_id", null: false
#   t.integer "status", null: false, default: 0
#   t.integer "priority_pt", null: false, default: 0
#   t.boolean "secret", null: :false, default: :false
#   t.timestamps
# end

class TsundocsController < ApplicationController
  def index
    @tsundocs = current_user.gets_tsundocs_of(params[:tsundocable_type] || "Book")
  end

  def new
    @tsundoc = Tsundoc.new
  end

  def create
    @tsundoc = Tsundoc.create(tsundoc_params)
    @taggings = Tagging.factory(tagging_params[:tag_ids], tagging_params[:tsundoc_id])
  end

  private

  def tsundoc_params
    params.permit(:priority_pt, :secret).merge(user: current_user, tsundocable_id: tsundocable.id, tsundocable_type: tsundocable.class)
  end

  def tagging_params
    params.permit(tag_ids: []).merge(tsundoc_id: @tsundoc.id)
  end

  def tsundocable
    @tsundocable || (raise "In TsundocablesController(like a BooksController), you must define Tsundocable instance variable as '@tsundocable'")
  end
end
