class Api::V1::ContainersController < ApplicationController
    
    before_action :find_container, except: [:index, :create]

    def index
        @containers = Container.all
        render json: @containers
    end

    def show
        render json: @container
    end

    def create
        container = Container.create(container_params)
        render json: container
    end

    def destroy
        @container.destory
    end

    def update
        @container.update(container_params)
        render json: @container
    end

    private

    def find_container
        @container = Container.find(params[:id])
    end

    def container_params
        params.require(:container).permit(:name, :percent_used, :barcode, :type_id, :parent_id, :photos)
    end
end