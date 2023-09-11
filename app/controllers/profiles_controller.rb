class ProfilesController < ApplicationController

    before_action :authenticate_user!

    def detail
        @profile = Profile.find(params[:id])
        render :detail
    end


    def new
        @user = current_user
        @profile = Profile.where(user_id: @user.id)

        if(@profile.is_a?(ActiveRecord::Base))
            redirect_to edit_profile_path(@profile.id)
        else
            @profile = Profile.new
            render :new
        end 
    end


    def create
        @profile = Profile.new(profile_params)
        if @profile.save
            redirect_to detail_profile_path(@profile), notice: 'Profile was created'
        else
            render :new, status: :unprocessable_entity
        end
    end


    # Edit
    def edit
        @profile = Profile.find(params[:id])
        render :edit
    end

    def update
        @profile = Profile.find(params[:id])
        if params[:profile][:image]
            @profile.image.attach(params[:profile][:image])
        end

        if @profile.update(profile_params)
            render :edit, notice: 'Profile was updated'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
        def profile_params
            params
                .require(:profile)
                .permit(
                    :first_name,
                    :last_name,
                    :zip_code,
                    :country,
                    :state, 
                    :city
                )
                .merge(user_id: params[:user_id])
        end

end
