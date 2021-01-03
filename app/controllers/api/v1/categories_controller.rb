class Api::V1::CategoriesController < ApplicationController
    
    before_action :find_category, except: [:index, :create, :new_user_category]
    before_action :find_user, only: :new_user_category

    def index
        @categories = Category.all
        render json: @categories
    end

    def show
        render json: @category
    end

    def create
        category = Category.create(category_params)
        render json: category
    end

    def destroy
        @category.destory
    end

    def update
        @category.update(category_params)
        render json: @category, serializer: CategorySerializer
    end

    def new_user_category
        category = @user.categories.create(category_params)
        render json: category, serializer: CategorySerializer
    end

    private

    def find_user
        @user = User.find(params[:user_id])
    end

    def find_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:id, :name, :description, :photo)
    end
end