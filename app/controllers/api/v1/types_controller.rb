class Api::V1::TypesController < ApplicationController
    
    before_action :find_type, except: [:index, :create]

    def index
        @types = Type.all
        render json: @types
    end

    def show
        render json: @type
    end

    def create
        type = Type.create(type_params)
        render json: type
    end

    def destroy
        @type.destory
    end

    def update
        @type.update(type_params)
        render json: @type
    end

    private

    def find_type
        @type = Type.find(params[:id])
    end

    def type_params
        params.require(:type).permit(:name, :description)
    end
end
