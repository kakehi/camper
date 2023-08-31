class ActivitiesController < ApplicationController

    def index
        @name = params[:name]
        if @name.present?
          @activity = Activity.where('name LIKE ?', "%#{@name}%")
        else
          @activity = Activity.all
        end
        render :index
    end

    def new
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.new
        @activities = Activity.where(camp_id: params[:camp_id])
        render :new
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
            params.require(:activity).permit(:name, :description, :hero_image).merge(camp_id: params[:camp_id])
        end
end
