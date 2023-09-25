class FavoriteOrganizationsController < ApplicationController

    def create
        @Profile = Profile.find_by(user_id: current_user.id)
        @favorite_organization = FavoriteOrganization.new(profile_id: @Profile.id, organization_id: params[:organization_id])

        if @favorite_organization.save
            redirect_to index_organization_path
        else
            redirect_to profile_detail_path
        end
    end

    def destroy
        @Profile = Profile.find_by(user_id: current_user.id)
        @favorite_organization = FavoriteOrganization.find_by(profile_id: @Profile.id, organization_id: params[:organization_id])
        @favorite_organization.destroy
        redirect_to index_organization_path
    end

end
