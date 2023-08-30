class ActivitiesController < ApplicationController

    def index
        render 'activities/index'
    end

    def new
        @activity = Activity.new
        render :new
    end
    
    def create
        @activity = Activity.new(activity_params)

        if params[:activity][:hero_image]
            @activity.image.attach(params[:activity][:hero_image])
        end

        if @activity.save
            redirect_to index_activity_path, notice: 'Activities are added'
        else
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
            params.require(:activity).permit(:name, :description, :hero_image)
        end
end
