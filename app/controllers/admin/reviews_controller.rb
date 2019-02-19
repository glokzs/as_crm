class Admin::ReviewsController < Admin::AdminController
  def index
    @reviews = Review.all
    @students = Student.all
    @review = Review.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
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
      redirect_to admin_reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    Review.destroy(params[:id])

    redirect_to admin_reviews_path
  end

  def homework_params
    params.require(:review).permit(:title, :date, :homework_id, :content, :rate)
  end
end
