class OrganizationsController < ApplicationController
    def new
        render :new
    end

    def create
        redirect_to 'organizations/new'
    end

    def edit
        render :edit
    end

    def update
        redirect_to 'organizations/edit'
    end
end
