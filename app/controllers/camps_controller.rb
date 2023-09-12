class CampsController < ApplicationController

    def index

        @name = params[:name]
        if @name.present?
          @camp = Camp.where('name LIKE ?', "%#{@name}%")
        else
          @camp = Camp.all
        end

        if params[:organization_id].present?
            @organization = Organization.find(params[:organization_id])
            @camps = Camp.where(organization_id: params[:organization_id])
        else
            @camps = Camp.all
        end

        render :index
    end
    


    # Profile
    def overview

        @organization = Organization.find(params[:organization_id])
        @camps = Camp.where(organization_id: params[:organization_id])
        @camp = Camp.find(params[:camp_id])

        render :overview
    end


    before_action :authenticate_user!

    def new
        @organization = Organization.find(params[:organization_id])
        if params[:default_camp].present? 
            @camp = Camp.find(params[:default_camp]).dup
            if @camp.name.present? 
                @camp.name += ' Duplicated'
            end
        else
            @camp = Camp.new
        end
        render :new
    end

    def create
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.new(camp_params)

        if params[:camp][:hero_image]
            @camp.hero_image.attach(params[:camp][:hero_image])
        end

        if @camp.save
            redirect_to index_camp_activities_path(@organization, @camp), notice: 'Camp was added'
        else
            @camps = Camp.where(organization_id: params[:organization_id])
            render :new, status: :unprocessable_entity
        end
    end



    def edit
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:id])
        render :edit
    end
    
    def update
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:id])
        if params[:camp][:hero_image]
            @camp.hero_image.attach(params[:camp][:hero_image])
        end

        if @camp.update(camp_params)
            redirect_to index_camp_activities_path(@organization, @camp), notice: 'Updated'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    
    
    def duplicate
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:id])
        redirect_to new_camp_path(@organization, default_camp: @camp), notice: 'Please save the duplicated camp.'
    end



    def destroy
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:id])
        @camp.destroy
        redirect_to index_organization_camp_path(@organization), notice: 'Deleted'
    end

    private
        def camp_params
            params
                .require(:camp)
                .permit(
                    :camp_type,
                    :name,
                    :subhead,
                    :description,
                    :hero_image,
                    :zip_code,
                    :country,
                    :state, 
                    :city,
                    :website,
                    :phone,
                    :email,
                    :age_group_min,
                    :age_group_max,
                    :base_price,
                    :discount_price,
                    :minimum_discount_week,
                    :required_minimum_session,
                    tag_ids: []
                )
                .merge(organization_id: params[:organization_id])
        end
end
