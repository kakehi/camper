class OrganizationsController < ApplicationController
    def index
        render 'organizations/index'
    end

    before_action :authenticate_user!

    def new
        @organization = Organization.new
        render :new
    end

    def create
        @organization = Organization.new(organization_params)

        if params[:organization][:hero_image]
            @organization.image.attach(params[:organization][:hero_image])
        end
        
        if @organization.save
            redirect_to index_organization_path, notice: 'Created'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        render :edit
    end

    def update
        redirect_to edit_organization_path
    end

    private
    def organization_params
        params.require(:organization).permit(:name, :description, :hero_image)
    end
end
