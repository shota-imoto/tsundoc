class MoviesController < TsundocsController
  include TsundocablesControllerModule

  def new
    @tsundoc = Tsundoc.new
    @tags = current_user.movie_tags
  end

  def create
    @tsundocable = Movie.create(movie_params)
    redirect_to root_path
  end

  private

  def movie_params
    params.permit(:title)
  end
end
