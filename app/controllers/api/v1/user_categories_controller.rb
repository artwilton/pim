class Api::V1::UserCategoriesController < ApplicationController

    def destroy
        user_category = UserCategory.find_by(user_id: params[:user_id], category_id: params[:category_id])
        user_category.destroy
        head :no_content

        # user = User.find(params[:user_id])
        # render json: user, serializer: UserCategoriesSerializer
    end
    
    private

    def user_categorys_params
        params.require(:user_category).permit(:category_id, :user_id)
    end

end
