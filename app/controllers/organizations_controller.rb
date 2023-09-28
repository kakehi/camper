class OrganizationsController < ApplicationController
    
    def index

        # PARAMS
        # Names
        @name = params[:name]
        if @name.present?
          @organizations = Organization.where('name LIKE ?', "%#{@name}%")
        else
          @organizations = Organization.all.reverse()
        end

        # Locations
        @locations = get_locations_by_params(get_url_params_into_array(params[:locations]))
        if @locations.count > 0
            _location_ids = @locations.map{|loc| loc[:id]}
        else
            _location_ids = location_region_options.map{|loc| loc[:id]}
        end

        # get organizations
        @organizations = Organization.where(
            region: _location_ids
        ).reverse()





        @tags = Tag.find([3, 7, 1, 20])
        
        @categories = params[:categories].present? ? 
            params[:categories].split(',').map{|c| 
                _tag = Tag.where('lower(name) = ?', c.downcase).first
            }:[]

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
            @organization.hero_image.attach(params[:organization][:hero_image])
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
            @organization.hero_image.attach(params[:organization][:hero_image])
        end
        if @organization.update(organization_params)
            redirect_to index_organization_camp_path(@organization), notice: 'Organization information is updated'
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
        params
            .require(:organization)
            .permit(
                :name,
                :description,
                :organization_type,
                :hero_image,
                :zip_code,
                :region,
                :country,
                :state, 
                :city,
                :website,
                :phone,
                :email,
                :age_group_min,
                :age_group_max,
                favorite_organizations: []
            )
    end
end
