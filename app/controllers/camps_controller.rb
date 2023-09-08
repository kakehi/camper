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

    before_action :authenticate_user!

    def new
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.new
        @camps = Camp.where(organization_id: params[:organization_id])
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

    def destroy
        @camp = Camp.find(params[:id])
        @camp.destroy
        redirect_to index_camp_path, notice: 'Deleted'
    end

    private
        def camp_params
            params
                .require(:camp)
                .permit(
                    :name,
                    :subhead,
                    :description,
                    :hero_image,
                    :age_group_min,
                    :age_group_max,
                    :base_price,
                    :discount_price,
                    :minimum_discount_week
                )
                .merge(organization_id: params[:organization_id])
        end
end
