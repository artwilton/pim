class Api::V1::UserItemsController < ApplicationController

    def destroy
        user_item = UserItem.find_by(user_id: params[:user_id], item_id: params[:item_id])
        user_item.destroy

        user_items = User.find(params[:user_id]).items
        render json: user_items
    end
    
    private

    def user_items_params
        params.require(:user_item).permit(:item_id, :user_id)
    end

end
