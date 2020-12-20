module TsundocablesControllerModule
  extend ActiveSupport::Concern

  included do
    after_action :create_tsundoc, only: :create
  end

  def create_tsundoc
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
