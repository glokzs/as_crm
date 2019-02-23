# frozen_string_literal: true

class Admin::ReviewsController < Admin::AdminController
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @reviews = @lesson.reviews.where(lesson_id: @lesson.id)
  end

  def show
    @homework = Homework.find(params[:id])
    @review = Review.find(params[:id])
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @homeworks = @lesson.homeworks
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to admin_lesson_reviews_path
    else
      render 'new'
    end
  end

  def edit
    @homework = Homework.find(params[:id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admin_lesson_review_path(@review)
    else
      render 'edit'
    end
  end

  def destroy
    Review.destroy(params[:id])

    redirect_to admin_reviews_path
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def review_params
    params.require(:review).permit(:title, :date, :homework_id, :content, :rate, :lesson_id)
  end
end
