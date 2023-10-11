class AdminController < ApplicationController

    def orgs
        @organization = Organization.all.reverse()
        render :orgs
    end
    
    def org_dashboard
        @organization = Organization.find(params[:id])
        @page_tab = params[:tab_id]
        @camps = Camp.where(organization_id: @organization)
        @activities = Activity.where(camp_id: @camps)
        @schedule_activities = ScheduleActivity.where(activity_id: @activities)
        
        @cats = Category.where(activity_id: @activities)
        @tags = Tag.select{|t| @cats.select{|cat| cat.tag_id === t.id }.count > 0 }


        Rails.logger.debug @activities

        render :org_dashboard
        
    end

end
