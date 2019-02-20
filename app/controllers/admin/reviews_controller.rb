# frozen_string_literal: true

class Admin::ReviewsController < Admin::AdminController
  def index
    @reviews = Review.all
  end

  def show
    @homework = Homework.find(params[:id])
    @reviews = Review.all
    @review = @reviews.where(homework_id: @homework.id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to admin_reviews_path
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admin_review_path(@review)
    else
      render 'edit'
    end
  end

  def destroy
    Review.destroy(params[:id])

    redirect_to admin_reviews_path
  end

  def review_params
    params.require(:review).permit(:title, :date, :homework_id, :content, :rate)
  end
end
