class ActivitiesController < ApplicationController
    def new
        render :new
    end

    def create
        redirect_to 'activities/new'
    end

    def edit
        render :edit
    end

    def update
        redirect_to 'activities/edit'
    end
end
