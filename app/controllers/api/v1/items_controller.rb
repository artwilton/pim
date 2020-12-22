class Api::V1::ItemsController < ApplicationController
    
    before_action :find_item, except: [:index, :create, :new_user_item]
    before_action :find_user, only: [:new_user_item, :update]


    def index
        @items = Item.all
        render json: @items
    end

    def show
        render json: @item
    end

    def create
        item = Item.create(item_params)
        render json: item
    end

    def destroy
        @item.destory
    end

    def update
        @item.update(item_params)
        render json: @user, serializer: UserItemsSerializer
    end

    def new_user_item
        item = @user.items.create(item_params)
        render json: item, serializer: CreateItemSerializer
    end

    private

    def find_user
        @user = User.find(params[:user_id])
    end

    def find_item
        @item = Item.find(params[:id])
    end

    def item_params
        # params.require(:item).permit(:name, :description, :notes, :barcode, :container_id, :category_id, :photo)
        params.permit(:name, :description, :notes, :barcode, :container_id, :category_id, :photo)
    end
end