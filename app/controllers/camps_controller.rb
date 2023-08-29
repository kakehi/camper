class CampsController < ApplicationController

    before_action :authenticate_user!

    def new
        render :new
    end

    def create
        redirect_to new_camp_path
    end

    def edit
        render :edit
    end

    def update
        redirect_to edit_camp_path
    end

end
