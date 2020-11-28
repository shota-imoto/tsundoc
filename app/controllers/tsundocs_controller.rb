class TsundocsController < ApplicationController
  def new
    # binding.pry
    @tsundoc = Tsundoc.new
  end

  def create
    @tsundoc = Tsundoc.create
  end

  private

  def tsundoc_params
    params.permit(:)
  end

  def book_params

  end
end
