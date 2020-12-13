class BooksController < TsundocsController
  def new
    @tsundoc = Tsundoc.new
    @tags = current_user.book_tags
  end

  def create
    ApplicationRecord.transaction do
      @tsundocable = Book.create(book_params)
      super
    end
    redirect_to root_path
  end

  private

  def book_params
    params.permit(:title, :author)
  end
end
