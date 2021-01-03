class Api::V1::UserContainersController < ApplicationController

    def destroy
        user_container = UserContainer.find_by(user_id: params[:user_id], container_id: params[:container_id])
        user_container.destroy
        head :no_content
    end

end