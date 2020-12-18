class Api::V1::UsersController < ApplicationController

    before_action :find_user, except: [:index, :create]

    def index
        @users = User.all
        render json: @users
    end

    def show
        render json: @user
    end

    def create
        user = User.create(user_params)
        render json: user
    end

    def destroy
        @user.destory
    end

    def update
        @user.update(user_params)
        render json: @user
    end

    def user_items
        render json: @user, serializer: UserItemsSerializer
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :profile_photo)
    end

    def user_item_params
        params.require(:item).permit(:name, :description, :notes, :barcode, :container_id, :category_id)
    end
end