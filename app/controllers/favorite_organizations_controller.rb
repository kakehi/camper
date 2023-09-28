class FavoriteOrganizationsController < ApplicationController

    def create
        @Profile = Profile.find_by(user_id: current_user.id)
        @organization = Organization.find_by(id: params[:organization_id])
        @favorite_organization = FavoriteOrganization.new(profile_id: @Profile.id, organization_id: params[:organization_id])

        respond_to do |format|
            if @favorite_organization.save
                format.js { render  :template => 'favorite_organizations/create.js.erb', :layout => false }
            end
        end
    end

    def destroy
        @Profile = Profile.find_by(user_id: current_user.id)
        @organization = Organization.find_by(id: params[:organization_id])
        @favorite_organization = FavoriteOrganization.find_by(profile_id: @Profile.id, organization_id: params[:organization_id])
        
        respond_to do |format|
            format.js
        end
    end

end
