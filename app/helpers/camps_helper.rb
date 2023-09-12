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
end
