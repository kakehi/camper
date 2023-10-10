class OrganizationsController < ApplicationController
    
    def index

        # PARAMS
        # Names
        @name = params[:name]
        if @name.present?
          @organizations = Organization.where('name LIKE ?', "%#{@name}%")
        else
          @organizations = Organization.all.reverse()
        end

        # Locations
        @locations = get_locations_by_params(get_url_params_into_array(params[:locations]))
        if @locations.count > 0
            _location_ids = @locations.map{|loc| loc[:id]}
        else
            _location_ids = location_region_options.map{|loc| loc[:id]}
        end

        # categoties
        @tags = get_tags_by_params(get_url_params_into_array(params[:categories]))
        @focus_tags = []

        # get organizations by regions
        @organizations = Organization.where(
            region: _location_ids
        )

        # get organizations by categories
        if @tags.count > 0
            
            # All selected tags
            _tag_ids = @tags.map{|tg| tg[:id]}
            
            # Focus tags, so users can find narrower results. For example, when the user selected VR after science tab was selected, they should be able to see VR results only
            _focust_tag_ids = _tag_ids.select do |tg|
               
                _tg_group = helpers.tag_groups.select{|tg_g| tg_g[:id] == tg }
                if _tg_group.count > 0
                    # Tag groups with children
                    Rails.logger.debug _tg_group[0][:children]
                    Rails.logger.debug _tag_ids
                    (_tg_group[0][:children] & _tag_ids).count == 0
                else
                    # Tag groups without children
                    true
                end
            end
            @focus_tags = Tag.where(id: _focust_tag_ids)

            @organizations = @organizations.select{|o|
                #camp
                o.camps.select{|c|
                    rtn = false
                    if defined?c.tags
                        rtn = (c.tags.map{|t| t.id} & _focust_tag_ids ).count > 0
                    end

                    if !rtn 
                        rtn = c.activities.select{|a|
                            if defined?a.tags
                                (a.tags.map{|t| t.id} & _focust_tag_ids ).count > 0
                            else
                                false
                            end
                        }.count > 0
                    end

                    rtn

                }.count > 0
            }
        end
        
        @organizations = @organizations.reverse()

        # featured tags
        @featured_tags = Tag.find([3, 7, 1, 20, 46, 23, 61, 6, 12])
        
        @categories = params[:categories].present? ? 
            params[:categories].split(',').map{|c| 
                _tag = Tag.where('lower(name) = ?', c.downcase).first
            }:[]

        render :index

    end


    def profile
        @organization = Organization.find(params[:id])
        @page_tab = params[:tab_id]

        render :profile

    end

    def dashboard
        @organization = Organization.find(params[:id])
        @page_tab = params[:tab_id]
        @camps = Camp.where(organization_id: @organization)
        @activities = Activity.where(camp_id: @camps)
        @schedule_activities = ScheduleActivity.where(activity_id: @activities)
        
        @cats = Category.where(activity_id: @activities)
        @tags = Tag.select{|t| @cats.select{|cat| cat.tag_id === t.id }.count > 0 }


        Rails.logger.debug @activities

        render :dashboard
        
    end

    before_action :authenticate_user!

    def new
        @organization = Organization.new
        @page = params[:page_id]
        render :new
    end

    def create
        @organization = Organization.new(organization_params)
        @next = params[:next]

        if params[:organization][:hero_image]
            @organization.hero_image.attach(params[:organization][:hero_image])
        end

        if @organization.save
            redirect_to index_organization_path, notice: 'New organization wss created'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @organization = Organization.find(params[:id])
        render :edit
    end
    
    def update
        @organization = Organization.find(params[:id])
        if params[:organization][:hero_image]
            @organization.hero_image.attach(params[:organization][:hero_image])
        end
        if @organization.update(organization_params)
            redirect_to index_organization_camp_path(@organization), notice: 'Organization information is updated'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @organization = Organization.find(params[:id])
        @organization.destroy
        redirect_to index_organization_path, notice: 'Deleted'
    end


    private
    def organization_params
        params
            .require(:organization)
            .permit(
                :name,
                :description,
                :organization_type,
                :hero_image,
                :zip_code,
                :region,
                :country,
                :state, 
                :city,
                :website,
                :phone,
                :email,
                :age_group_min,
                :age_group_max,
                favorite_organizations: []
            )
    end
end
