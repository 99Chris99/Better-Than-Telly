class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]
    before_action :find_user, only: [:new]
    before_action :require_login, only: [:show, :edit, :update, :destroy]

    def index
        if params[:event_id]
            @reviews = Review.where(:event_id=>params[:event_id])
        else
            @reviews = Review.all
        end
    end

    def show

    end

    def new
        @review = Review.new
        @rating_range = Review.rating_range
        
    end

    def create
        
        new_review = Review.create(review_params)
        if new_review.valid?
            redirect_to review_path(new_review)
        else
            flash[:errors] = new_review.errors.full_messages
            redirect_to new_review_path
        end
    end

    def edit

    end

    def update
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
    end

    private

    def find_review
        @review=Review.find(params[:id])
    end

    def find_user
        @user=User.find(session[:user_id])
    end

    def review_params
        params.require(:review).permit(:title, :content, :user_id, :rating, :event_id)
    end
end
