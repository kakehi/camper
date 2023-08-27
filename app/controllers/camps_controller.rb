class CampsController < ApplicationController
    def new
        render :new
    end

    def create
        redirect_to 'camps/new'
    end

    def edit
        render :edit
    end

    def update
        redirect_to 'camps/edit'
    end
end
