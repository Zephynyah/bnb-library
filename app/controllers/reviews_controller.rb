class ReviewsController < ApplicationController
  before_action :get_book
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews
  def index
    @reviews = @book.reviews
    @title = @book.title
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    # @review = Review.new
    @review = @book.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = @book.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to book_reviews_path(@book), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
    # @review = Review.new(review_params)

    # if @review.save
    #   redirect_to @review, notice: "Review was successfully created."
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /reviews/1
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to book_review_path(@book), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
    # if @review.update(review_params)
    #   redirect_to @review, notice: "Review was successfully updated."
    # else
    #   render :edit, status: :unprocessable_entity
    # end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to book_reviews_path(@book), notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
    # @review.destroy
    # redirect_to reviews_url, notice: "Review was successfully destroyed."
  end

  private
    def get_book
      @book = Book.find(params[:book_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      # @review = Review.find(params[:id])
      @review = @book.reviews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:body, :book_id)
    end
end
