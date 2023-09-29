module ApplicationHelper
    def age_group_options
        [
            {
                name: "Unselected",
                id: nil
            },
            {
                name: "1 year",
                id: 1
            },
            {
                name: "2 year",
                id: 2
            },
            {
                name: "3 year",
                id: 3
            },
            {
                name: "4 year",
                id: 4
            },
            {
                name: "5 year",
                id: 5
            },
            {
                name: "Kindargarten",
                id: 10
            },
            {
                name: "Grade 1",
                id: 11
            },
            {
                name: "Grade 2",
                id: 12
            },
            {
                name: "Grade 3",
                id: 13
            },
            {
                name: "Grade 4",
                id: 14
            },
            {
                name: "Grade 5",
                id: 15
            },
            {
                name: "Grade 6",
                id: 20
            },
            {
                name: "Grade 7",
                id: 21
            },
            {
                name: "Grade 8",
                id: 22
            },
            {
                name: "Grade 9",
                id: 30
            },
            {
                name: "Grade 10",
                id: 31
            },
            {
                name: "Grade 11",
                id: 32
            },
            {
                name: "Grade 12",
                id: 33
            }
        ]
    end


    def location_region_options
        [
            {
                id: nil,
                name: "Other region"
            },
            {
                id: 1,
                name: "New York-Newark",
                zip_codes: [07624, 11542],
                hero_image: "/images/cities/new-york.jpeg"
            },
            {
                id: 2,
                name: "Washington-Baltimore-Arlington",
                zip_codes: [20016, 21210, 21234, 21244, 22303],
                hero_image: "/images/cities/washington-dc.jpeg"
            },
            {
                id: 3,
                name: "Philadelphia",
                zip_codes: [19102, 19144],
                hero_image: "/images/cities/philadephia.jpeg"
            },
            {
                id: 31,
                name: "Raleigh-Durham-Cary",
                zip_codes: [27601]
            },
            {
                id: 33,
                name: "Richmond-VA",
                zip_codes: [23220]
            },
            {
                id: 33,
                name: "Virginia Beach-Norfolk",
                zip_codes: []
            }
        ]
    end

    def get_locations_by_params (params) 
        if params.count > 0
            params.map{|param|
                location_region_options.select{|l| l[:name].downcase == param}.first
            }
        else
            []
        end
    end

    def get_url_params_into_array (params) 
        if params.present?
            params.split(',')
        else
            []
        end
    end



    
end
