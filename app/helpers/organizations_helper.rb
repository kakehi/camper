module OrganizationsHelper
    def organization_type_options
        [
            {
                name: "Private school",
                id: 1
            },
            {
                name: "Public school",
                id: 2
            },
            {
                name: "Museum",
                id: 10
            },
            {
                name: "Others",
                id: 200
            },
        ]        
    end


    def get_organization_target_group(o)
        if defined?(group)
            # TODO: add group for multi year phase
        else
            camps = Camp.where(organization_id: o.id)
        end
    end

    
    def get_organization_href(o)
        camps = get_organization_target_group(o)
        camp = camps.first
    
    
        if camps.count == 1 && camp.present?
            href = index_camp_activities_path(o, camp)
        else
            href = index_organization_camp_path(o)
        end

        href
    end


    def organization_get_minimum_weekly_cost(o)
        camps = get_organization_target_group(o)
        minimum_weekly_price = 0
        if camps.count() > 1
            camps.each{|c|
                camp_minimum_weekly_cost = camp_get_minimum_weekly_cost(c)
                if(camp_minimum_weekly_cost < minimum_weekly_price)
                    minimum_weekly_price = camp_minimum_weekly_cost
                end
            }
        elsif camps.count() == 1
            minimum_weekly_price = camp_get_minimum_weekly_cost(camps.first())
        end
        minimum_weekly_price
    end


    def organization_get_camp_tags(o)
        camps = get_organization_target_group(o)
        tags = []
        camps.each{|c|
            tags.concat(camp_get_tags(c))
        }

        sorted_tags = []
        while tags.count > 0 
            max_tag = tags.max_by { |v| tags.count(v) }
            sorted_tags.push(max_tag)
            tags.delete(max_tag)
        end 

        sorted_tags
    end


    def organization_get_age_group_from_camps(o)
        camps = get_organization_target_group(o)
        age_group_min = nil
        age_group_max = nil
        
        activities.each do |activity|
            if defined? (activity.age_group_min)
                age_group_min = activity.age_group_min
            end
            if activity.age_group_max.present?
                age_group_max = activity.age_group_max
            end
        end

        if(activities.count == 0)
            if age_group_min == nil && camp.age_group_min.present?
                age_group_min = camp.age_group_min
            end
            if age_group_max == nil && camp.age_group_max.present?
                age_group_max = camp.age_group_max
            end
        else

        end

        render "uis/grammar/age-group",
            age_group_min: age_group_min,
            age_group_max: age_group_max

    end




    # Age group
    def organization_get_age_group_min_from_camps(o)
        camps = Camp.where(organization_id: o.id)
        age_group_min = nil
        camps.each do |c|
            c_age_group_min = camp_get_age_group_min_from_activities(c)
            if (defined? c_age_group_min) && (c_age_group_min.is_a? Integer)
                if (age_group_min == nil) || ((age_group_min.is_a? Integer) && (age_group_min > c_age_group_min))
                    age_group_min = c_age_group_min
                end
            end
        end
        if(camps.count == 0)
            if (age_group_min == nil) && (defined? o.age_group_min) && (o.age_group_min.is_a? Integer)
                age_group_min = o.age_group_min
            end
        end
        age_group_min
    end

    def organization_get_age_group_max_from_camps(o)
        camps = Camp.where(organization_id: o.id)
        age_group_max = nil
        camps.each do |c|
            c_age_group_max = camp_get_age_group_max_from_activities(c)
            if (defined? c_age_group_max) && (c_age_group_max.is_a? Integer)
                if (age_group_max == nil) || ((age_group_max.is_a? Integer) && (age_group_max < c_age_group_max))
                    age_group_max = c_age_group_max
                end
            end
        end
        if(camps.count == 0)
            if (age_group_max == nil) && (defined? o.age_group_max) && (o.age_group_max.is_a? Integer)
                age_group_max = o.age_group_max
            end
        end
        age_group_max
    end


end
