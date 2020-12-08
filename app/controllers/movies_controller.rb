class MoviesController < TsundocsController
  def new
    @tsundoc = Tsundoc.new
    @tags = MovieTag.all
  end

  def create
    ApplicationRecord.transaction do
      @tsundocable = Movie.create(movie_params)
      super
    end
    redirect_to root_path
  end

  private

  def movie_params
    params.permit(:title)
  end
end
