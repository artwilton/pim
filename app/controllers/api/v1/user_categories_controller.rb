class Api::V1::UserCategoriesController < ApplicationController

    def destroy
        user_category = UserCategory.find_by(user_id: params[:user_id], category_id: params[:category_id])
        user_category.destroy
        head :no_content
    end
    
end
