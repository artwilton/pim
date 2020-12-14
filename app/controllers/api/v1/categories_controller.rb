class Api::V1::CategoriesController < ApplicationController
    
    before_action :find_category, except: [:index, :create]

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
        render json: @category
    end

    private

    def find_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name, :description, :photo)
    end
end