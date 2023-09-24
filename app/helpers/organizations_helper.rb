module OrganizationsHelper
    def organization_type_options
        [
            {
                name: "Private school",
                id: 1
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


    def get_organization_href(o)
        camps = Camp.where(organization_id: o.id)
        camp = camps.first
    
    
        if camps.count == 1 && camp.present?
            href = index_camp_activities_path(o, camp)
        else
            href = index_organization_camp_path(o)
        end

        href
    end


    def organization_get_minimum_weekly_cost(o)
        camps = Camp.where(organization_id: o.id)
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
        camps = Camp.where(organization_id: o.id)
        tags = []
        camps.each{|c|
            tags.concat(camp_get_tags(c))
        }
        tags
    end

end
