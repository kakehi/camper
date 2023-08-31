class OrganizationsController < ApplicationController
    
    def index
        @name = params[:name]
        if @name.present?
          @organization = Organization.where('name LIKE ?', "%#{@name}%")
        else
          @organization = Organization.all
        end
        render :index
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
        @organization = Organization.find(params[:id])
        render :edit
    end
    
    def update
        @organization = Organization.find(params[:id])
        if params[:organization][:hero_image]
            @organization.image.attach(params[:organization][:hero_image])
        end
        if @organization.update(organization_params)
            redirect_to index_organization_path, notice: 'Updated'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @organization = Organization.find(params[:id])
        @organization.destroy
        redirect_to index_organization_path, notice: 'Deleted'
    end

    private
    def organization_params
        params.require(:organization).permit(:name, :description, :hero_image)
    end
end
