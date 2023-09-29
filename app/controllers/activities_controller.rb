class ActivitiesController < ApplicationController

    def index
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.where(camp_id: params[:camp_id])
        
        render :index
    end

    def new
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @page = params[:page_id]

        if params[:default_activity].present? 
            @activity = Activity.find(params[:default_activity]).dup
            if @activity.name.present? 
                @activity.name += ' Duplicated'
            end
        else
            @activity = Activity.new
        end
        render :new
    end
    
    def create
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.new(activity_params)
        @next = params[:next]

        if params[:activity][:hero_image]
            @activity.hero_image.attach(params[:activity][:hero_image])
        end

        if @activity.save
            if @next == "0"
                redirect_to index_camp_activities_path(@organization, @camp), notice: 'New session was added'
            else
                redirect_to activity_edit_path(@organization, @camp, @activity, @next), notice: 'New session was created'
            end
        else
            
            @activities = Activity.where(camp_id: params[:camp_id])
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.find(params[:id])
        @page = params[:page_id]

        render :edit
    end
    
    def update
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.find(params[:id])
        @next = params[:next]
        
        if params[:activity][:hero_image]
            @activity.hero_image.attach(params[:activity][:hero_image])
        end
        
       

        if @activity.update(activity_params)
            if @next == "0"
                redirect_to index_camp_activities_path(@organization, @camp), notice: 'Session was updated'
            else
                redirect_to activity_edit_path(@organization, @camp, @activity, @next), notice: 'Session was updated'
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end


    def duplicate
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activity = Activity.find(params[:id])
        redirect_to activity_new_path(@organization, @camp, 1, default_activity: @activity), notice: 'Please save the duplicated session.'
    end


    def destroy
        _activity = Activity.find(params[:id])
        _c_id = _activity.camp_id
        _o_id = Camp.find_by(id: _c_id).organization_id
        _activity.destroy
        redirect_to index_camp_activities_path(_o_id, _c_id), notice: 'Session was deleted'
    end

    
    def activity_params
        params
            .require(:activity)
            .permit(
                :name,
                :description,
                :hero_image,
                :age_group_min,
                :age_group_max,
                :start_at,
                :end_at,
                :start_time,
                :end_time,
                :base_price,
                :discount_price,
                tag_ids: []
            )
            .merge(camp_id: params[:camp_id])
    end
end
