class BooksController < TsundocsController
  include TsundocablesControllerModule

  def new
    @tsundoc = Tsundoc.new
    @tags = current_user.book_tags
  end

  def create
    @tsundocable = Book.create(book_params)
    redirect_to root_path
  end

  private

  def book_params
    params.permit(:title, :author)
  end
end
