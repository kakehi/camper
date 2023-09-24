module CampsHelper
    def camp_type_options
        [
            "Camp with themed schedule",
            "Single theme camp"
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


    def camp_get_age_group_from_activities(camp)
        activities = Activity.where(camp_id: camp.id)
        age_group_min = nil
        age_group_max = nil
        activities.each do |activity|
            if activity.age_group_min.present?
                age_group_min = activity.age_group_min
            end
            if activity.age_group_max.present?
                age_group_max = activity.age_group_max
            end
        end

        render "uis/grammar/age-group",
            size: "medium",
            age_group_min: age_group_min,
            age_group_max: age_group_max

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
