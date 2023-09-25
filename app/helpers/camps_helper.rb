module CampsHelper
    def camp_type_options
        [
            "Camp with themed schedule",
            "Single theme camp"
        ]        
    end

    def camp_group_options
        [
            {
                id: 2018,
                name: "2018 Summer camp"
            },
            {
                id: 2017,
                name: "2017 Summer camp"
            }
        ]        
    end

    def required_minimum_session_options
        [
            {
                id: 1,
                name: "One week"
            },
            {
                id: 2,
                name: "Two weeks"
            },
            {
                id: 3,
                name: "Three weeks"
            },
            {
                id: 4,
                name: "Four weeks"
            }
        ]        
    end




    # Age group
    def camp_get_age_group_min_from_activities(c)
        activities = Activity.where(camp_id: c.id)
        age_group_min = nil
        activities.each do |a|
            if (defined? a.age_group_min) && (a.age_group_min.is_a? Integer)
                if (age_group_min == nil) || ((age_group_min.is_a? Integer) && (age_group_min > a.age_group_min))
                    age_group_min = a.age_group_min
                end
            end
        end
        if(activities.count == 0)
            if (age_group_min == nil) && (defined? c.age_group_min) && (c.age_group_min.is_a? Integer)
                age_group_min = c.age_group_min
            end
        end
        age_group_min
    end

    def camp_get_age_group_max_from_activities(c)
        activities = Activity.where(camp_id: c.id)
        age_group_max = nil
        activities.each do |a|
            if (defined? a.age_group_max) && (a.age_group_max.is_a? Integer)
                if (age_group_max == nil) || ((age_group_max.is_a? Integer) && (age_group_max < a.age_group_max))
                    age_group_max = a.age_group_max
                end
            end
        end
        if(activities.count == 0)
            if (age_group_max == nil) && (defined? c.age_group_max) && (c.age_group_max.is_a? Integer)
                age_group_max = c.age_group_max
            end
        end
        age_group_max
    end

    def camp_render_age_group_from_activities(c)
        render "uis/grammar/age-group",
            age_group_min: camp_get_age_group_min_from_activities(c),
            age_group_max: camp_get_age_group_max_from_activities(c)
    end








    def camp_get_minimum_weekly_cost(c)
        minimum_weekly_price = 0
        activities = Activity.where(camp_id: c.id)
        activities.each{|a|
            if a.start_at.present? && a.end_at.present? && a.base_price.present?
                addition = (a.end_at - a.start_at)%7
                if a.end_at - a.start_at > 5
                    week_count = a.start_at.step(a.end_at+addition, 7).count
                else
                    week_count = 1
                end
                
                weekly_price = a.base_price / week_count
                if minimum_weekly_price == 0 || minimum_weekly_price > weekly_price
                    minimum_weekly_price = weekly_price
                end

            end
        }
        minimum_weekly_price
    end


    def camp_get_tags(c)
        tags = []
        camp_tags = CampTagRelation.where(camp_id: c.id)
        camp_tags.each {|tag|
            tags = tags.concat(Tag.where(id: tag.tag_id))
        }

        activities = Activity.where(camp_id: c.id)
        activities.each{|a|
            cats = Category.where(activity_id: a.id)
            cats.each {|cat|
                tags = tags.concat(Tag.where(id: cat.tag_id))
            }
        }
        tags
    end

end
