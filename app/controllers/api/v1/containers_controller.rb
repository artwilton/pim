class Api::V1::ContainersController < ApplicationController
    
    before_action :find_container, except: [:index, :create, :new_user_container]
    before_action :find_user, only: :new_user_container

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
        render json: @container, serializer: ContainerSerializer
    end

    def new_user_container
        container = @user.containers.create(container_params)
        render json: container, serializer: ContainerSerializer
    end

    private

    def find_user
        @user = User.find(params[:user_id])
    end

    def find_container
        @container = Container.find(params[:id])
    end

    def container_params
        params.permit(:name, :description, :notes, :percent_used, :barcode, :type_id, :parent_id, :photo)
    end

end