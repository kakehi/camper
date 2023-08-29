class ActivitiesController < ApplicationController
    def new
        render :new
    end

    def create
        redirect_to new_activity_path
    end

    def edit
        render :edit
    end

    def update
        redirect_to edit_activity_path
    end
end
