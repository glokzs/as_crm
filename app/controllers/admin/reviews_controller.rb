# frozen_string_literal: true

class Admin::ReviewsController < Admin::AdminController
  # before_action :set_homework

  def index
    @lesson = Lesson.find(params[:lesson_id])
    @reviews = @lesson.reviews.where(lesson_id: @lesson.id)
  end

  def show
    @lesson = Lesson.find(params[:lesson_id])
    @homework = Homework.find(params[:id])
    @review = Review.find(params[:id])
    
  end

  def new
    @review = Review.new
     @homework = Homework.find(id: params[:homework_id])
  end

  def create
     @homework = Homework.find(id: params[:homework_id])
    @review = Review.new
    if @review.save
      redirect_to admin_lesson_review_path(@review)
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

  def set_homework
    @homework = Homework.find(params[:id])
  end  

  def review_params
    params.require(:review).permit(:title, :date, :homework_id, :content, :rate)
  end
end
