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

        @activity = Activity.new(activity_params)

        if params[:activity][:hero_image]
            @activity.image.attach(params[:activity][:hero_image])
        end

        if @activity.save
            redirect_to new_activity_path(@organization, params[:camp_id]), notice: 'Activities are added'
        else
            @camp = Camp.find(params[:camp_id])
            @activities = Activity.where(camp_id: params[:camp_id])
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        render :edit
    end

    def update
        redirect_to edit_activity_path
    end

    private
        def activity_params
            params
                .require(:activity)
                .permit(
                    :name,
                    :description,
                    :hero_image,
                    :start_year,
                    :start_month,
                    :start_date,
                    :end_year,
                    :end_month,
                    :end_date
                )
                .merge(camp_id: params[:camp_id])
        end
end
