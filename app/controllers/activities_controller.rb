class ActivitiesController < ApplicationController

    def index
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])

        @activity = Activity.where(camp_id: params[:camp_id])
        
        render :index
    end

    def new
        @activity = Activity.new
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
    end
    
    def create
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.new(activity_params)

        if params[:activity][:hero_image]
            @activity.image.attach(params[:activity][:hero_image])
        end

        if @activity.save
            redirect_to index_camp_activities_path(@organization, @camp), notice: 'Activities are added'
        else
            
            @activities = Activity.where(camp_id: params[:camp_id])
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.find(params[:id])
        render :edit
    end
    
    def update
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.find(params[:id])

        if params[:activity][:hero_image]
            @activity.image.attach(params[:activity][:hero_image])
        end
        
        
        if @activity.update(activity_params)
            @activity.inspect
            redirect_to index_organization_camp_path(@organization, @camp), notice: 'Updated'
        else
            Rails.logger.debug(@activity.errors.inspect)
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.find(params[:id])
        @activity.destroy
        redirect_to index_camp_activities_path(@organization, @camp), notice: 'Deleted'
    end

    private
        def activity_params
            params
                .require(:activity)
                .permit(
                    :name,
                    :description,
                    :hero_image,
                    :age_group_min,
                    :age_group_max,
                    :start_year,
                    :start_month,
                    :start_date,
                    :end_year,
                    :end_month,
                    :end_date,
                    tag_ids: []
                )
                .merge(camp_id: params[:camp_id])
        end
end
