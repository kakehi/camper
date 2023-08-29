class OrganizationsController < ApplicationController
    def index
        render :index
    end

    before_action :authenticate_user!

    def new
        render :new
    end

    def create
        redirect_to new_organization_path
    end

    def edit
        render :edit
    end

    def update
        redirect_to edit_organization_path
    end
end
