class Api::V1::ItemsController < ApplicationController
    
    before_action :find_item, except: [:index, :create]

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
        render json: @item
    end

    private

    def find_item
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name, :description, :notes, :barcode, :container_id, :category_id, :photos)
    end
end