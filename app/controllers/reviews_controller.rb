class ReviewsController < ApplicationController
  before_action :find_cocktail, only: [:new, :create, :destroy]

  def new
    @review = Review.new(cocktail: @cocktail)
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
