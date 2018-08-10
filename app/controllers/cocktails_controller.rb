class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]

  def index
    if params["/cocktails"]
      @cocktails = Cocktail.search(params["/cocktails"][:query])
      @title = "Search for #{params["/cocktails"][:query]}"
      @subtitle = "Check out the options"
      @search = params["/cocktails"][:query]
    else
      @cocktails = Cocktail.all
      @title = "It's 5 o'clock somewhere"
      @subtitle = "Have a drink already"
      @search = ''
    end
  end

  def show;end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
