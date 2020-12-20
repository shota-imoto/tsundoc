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
end
