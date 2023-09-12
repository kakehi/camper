class FavoriteOrganizationsController < ApplicationController

    def create
        @Profile = Profile.find_by(user_id: current_user.id)
        @favorite_organization = FavoriteOrganizations.new(profile_id: @Profile.id, post_id: params[:organization_id])
        @favorite_organization.save
        render index_organization_path
    end

    def destroy
        @Profile = Profile.find_by(user_id: current_user.id)
        @favorite_organization = FavoriteOrganizations.new(profile_id: @Profile.id, post_id: params[:organization_id])
        @favorite_organization.destroy
        render index_organization_path
    end

end
