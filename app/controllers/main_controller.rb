class MainController < ApplicationController
  def index
  end


  def show
    @search_term = params[:term][:search]
    response = HTTParty.get('https://itunes.apple.com/search', { query: {term: @search_term} })
    @itunes = nil
    if response.code == 200
      @itunes = JSON.parse(response.body)
      @itunes = @itunes['results']
    end
  end

  private

  # def search_params
  #   params.require(:term).permit(:search)
  # end
end
