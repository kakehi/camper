class ScheduleActivitiesController < ApplicationController

    def create
        @Profile = Profile.find_by(user_id: current_user.id)
        @activity_schedule = ScheduleActivity.new(profile_id: @Profile.id, activity_id: params[:activity_id])
        @activity_schedule.save
        redirect_to index_organization_path
    end

    def destroy
        @Profile = Profile.find_by(user_id: current_user.id)
        @activity_schedule = ScheduleActivity.find_by(profile_id: @Profile.id, activity_id: params[:activity_id])
        @activity_schedule.destroy
        redirect_to  index_organization_path
    end
end
