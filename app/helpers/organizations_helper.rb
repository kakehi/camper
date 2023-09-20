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
end
