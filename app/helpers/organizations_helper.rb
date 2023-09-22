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


    def get_organization_href(organization)
        camps = Camp.where(organization_id: organization.id)
        camp = camps.first
    
    
        if camps.count == 1 && camp.present?
            href = index_camp_activities_path(organization, camp)
        else
            href = index_organization_camp_path(organization)
        end

        href
    end

end
