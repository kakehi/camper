class CampsController < ApplicationController

    def index

        @name = params[:name]
        if @name.present?
          @camp = Camp.where('name LIKE ?', "%#{@name}%")
        else
          @camp = Camp.all
        end


        if params[:organization_id].present?
            @organization = Organization.find(params[:organization_id])
            @camps = Camp.where(organization_id: params[:organization_id])
        else
            @camps = Camp.all
        end

        render :index
    end
    


    # Profile
    def overview

        @organization = Organization.find(params[:organization_id])
        @camps = Camp.where(organization_id: params[:organization_id])
        @camp = Camp.find(params[:camp_id])

        render :overview
    end


    before_action :authenticate_user!

    def new
        @organization = Organization.find(params[:organization_id])
        @page = params[:page_id]

        if params[:default_camp].present? 
            @camp = Camp.find(params[:default_camp]).dup
            if @camp.name.present? 
                @camp.name += ' [Duplicated]'
            end
        else
            @camp = Camp.new
        end
        render :new
    end

    def create
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.new(camp_params)
        @next = params[:next]

        if params[:camp][:hero_image]
            @camp.hero_image.attach(params[:camp][:hero_image])
        end

        if @camp.save
            if @next == "0"
                redirect_to index_camp_activities_path(@organization, @camp), notice: 'Camp was created'
            else
                redirect_to camp_edit_path(@organization, @camp, @next), notice: 'New camp was created'
            end
        else
            @camps = Camp.where(organization_id: params[:organization_id])
            render :new, status: :unprocessable_entity
        end
    end



    def edit
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:id])
        @page = params[:page_id]

        render :edit
    end
    



    def update
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:id])
        @next = params[:next]

        if params[:camp][:hero_image]
            @camp.hero_image.attach(params[:camp][:hero_image])
        end

        if @camp.update(camp_params)
            if @next == "0"
                redirect_to index_camp_activities_path(@organization, @camp), notice: 'Camp information was updated'
            else
                redirect_to camp_edit_path(@organization, @camp, @next), notice: 'Camp information was updated'
            end
        else
            render :edit, status: :unprocessable_entity
        end
    end

    
    
    def duplicate
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:id])

        dup_c = @camp.dup
        dup_c.name += " [Duplicated]"
        dup_c.save

        @activities = Activity.where(camp_id: @camp.id)

        if @activities.count > 0 
            @activities.each do |a|
                dup_a = a.dup
                dup_a.camp_id = dup_c.id
                dup_a.save
            end
        end

        redirect_to camp_edit_path(@organization, dup_c, 1), notice: 'Camp was duplicated'
    end


    def override_children
        @organization = Organization.find(params[:organization_id])
        @camp = Camp.find(params[:camp_id])
        @activities = Activity.where(camp_id: @camp.id)

        if params[:id] == 'age-group'
            if @activities.count > 0 
                @activities.each do |a|
                    a.age_group_min = @camp.age_group_min
                    a.age_group_max = @camp.age_group_max
                    a.update(activity_params)
                end
            end
            
        end

        redirect_to camp_edit_path(@organization, @camp, 1), notice: 'Associated sessions were all updated'
    end



    def destroy
        @camp = Camp.find(params[:id])
        _organization = Organization.find(@camp.organization_id)
        
        _camp_name = @camp.name;
        @camp.destroy
        redirect_to index_organization_camp_path(_organization), alert: "Camp #{_camp_name} eleted"
    end



    private
        def camp_params
            params
                .require(:camp)
                .permit(
                    :camp_type,
                    :camp_group,
                    :name,
                    :subhead,
                    :description,
                    :hero_image,
                    :zip_code,
                    :country,
                    :state, 
                    :city,
                    :website,
                    :phone,
                    :email,
                    :age_group_min,
                    :age_group_max,
                    :start_time,
                    :end_time,
                    :base_price,
                    :discount_price,
                    :minimum_discount_week,
                    :required_minimum_session,
                    tag_ids: []
                )
                .merge(organization_id: params[:organization_id])
        end
end
