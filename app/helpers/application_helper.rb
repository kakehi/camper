module ApplicationHelper

    def service_title 
        "[The service title]"
    end

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
                name: "New York",
                description: "New York, Newark",
                zip_codes: [07624, 11542],
                hero_image: "/images/cities/new-york.jpeg"
            },
            {
                id: 2,
                name: "Washington DC",
                description: "Washington, Baltimore, Arlington",
                zip_codes: [20016, 21210, 21234, 21244, 22303],
                hero_image: "/images/cities/washington-dc.jpeg"
            },
            {
                id: 3,
                name: "Philadelphia",
                description: "Philadelphia, Reading, Camden, Wilmington",
                hero_image: "/images/cities/philadephia.jpeg",
                zip_codes: [19102, 19144]
            },
            {
                id: 7,
                name: "Boston",
                description: "Boston, Worcester, Providence",
                hero_image: "/images/cities/boston.jpeg",
                zip_codes: [3855]
            },
            {
                id: 25,
                name: "Pittsburgh",
                description: "Pittsburgh, New Castle, Weirton",
                hero_image: "/images/cities/pittsburgh.jpeg",
                zip_codes: [15212]
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
                id: 34,
                name: "Virginia Beach-Norfolk",
                zip_codes: []
            }
        ]
    end

    def location_options
        [
            {
                id: "usa",
                name: "United states",
                children: [
                    {
                        id: "AL",
                        name: "Alabama"
                    },
                    {
                        id: "AK",
                        name: "Alaska"
                    },
                    {
                        id: "AZ",
                        name: "Arizona"
                    },
                    {
                        id: "AR",
                        name: "Arkansas"
                    },
                    {
                        id: "CA",
                        name: "California"
                    },
                    {
                        id: "CO",
                        name: "Colorado"
                    },
                    {
                        id: "CT",
                        name: "Connecticut"
                    },
                    {
                        id: "DE",
                        name: "Delaware"
                    },
                    {
                        id: "DC",
                        name: "District of Columbia"
                    },
                    {
                        id: "FL",
                        name: "Florida"
                    },
                    {
                        id: "GA",
                        name: "Georgia"
                    },
                    {
                        id: "HI",
                        name: "Hawaii"
                    },
                    {
                        id: "ID",
                        name: "Idaho"
                    },
                    {
                        id: "IL",
                        name: "Illinois"
                    },
                    {
                        id: "IN",
                        name: "Indiana"
                    },
                    {
                        id: "IA",
                        name: "Iowa"
                    },
                    {
                        id: "KS",
                        name: "Kansas"
                    },
                    {
                        id: "KY",
                        name: "Kentucky"
                    },
                    {
                        id: "LA",
                        name: "Louisiana"
                    },
                    {
                        id: "ME",
                        name: "Maine"
                    },
                    {
                        id: "MD",
                        name: "Maryland"
                    },
                    {
                        id: "MA",
                        name: "Massachusetts"
                    },
                    {
                        id: "MI",
                        name: "Michigan"
                    },
                    {
                        id: "MN",
                        name: "Minnesota"
                    },
                    {
                        id: "MS",
                        name: "Mississippi"
                    },
                    {
                        id: "MO",
                        name: "Missouri"
                    },
                    {
                        id: "MT",
                        name: "Montana"
                    },
                    {
                        id: "NE",
                        name: "Nebraska"
                    },
                    {
                        id: "NV",
                        name: "Nevada"
                    },
                    {
                        id: "NH",
                        name: "New Hampshire"
                    },
                    {
                        id: "NJ",
                        name: "New Jersey"
                    },
                    {
                        id: "NM",
                        name: "New Mexico"
                    },
                    {
                        id: "NY",
                        name: "New York"
                    },
                    {
                        id: "NC",
                        name: "North Carolina"
                    },
                    {
                        id: "ND",
                        name: "North Dakota"
                    },
                    {
                        id: "OH",
                        name: "Ohio"
                    },
                    {
                        id: "OK",
                        name: "Oklahoma"
                    },
                    {
                        id: "OR",
                        name: "Oregon"
                    },
                    {
                        id: "PA",
                        name: "Pennsylvania"
                    },
                    {
                        id: "PR",
                        name: "Puerto Rico"
                    },
                    {
                        id: "RI",
                        name: "Rhode Island"
                    },
                    {
                        id: "SC",
                        name: "South Carolina"
                    },
                    {
                        id: "SD",
                        name: "South Dakota"
                    },
                    {
                        id: "TN",
                        name: "Tennessee"
                    },
                    {
                        id: "TX",
                        name: "Texas"
                    },
                    {
                        id: "UT",
                        name: "Utah"
                    },
                    {
                        id: "VT",
                        name: "Vermont"
                    },
                    {
                        id: "VI",
                        name: "Virgin Islands"
                    },
                    {
                        id: "VA",
                        name: "Virginia"
                    },
                    {
                        id: "WA",
                        name: "Washington"
                    },
                    {
                        id: "WV",
                        name: "West Virginia"
                    },
                    {
                        id: "WI",
                        name: "Wisconsin"
                    },
                    {
                        id: "WY",
                        name: "Wyoming"
                    }
                ]
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


    def get_tags_by_params (params) 
        if params.count > 0
            params.map{|param|
                Tag.select{|t| t[:name].downcase == param}.first
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

    def insert_url_params (params) 
        uri = URI.parse(request.fullpath)
        query = Rack::Utils.parse_nested_query(uri.query)

        # Locaiton
        if params["locations"].is_a? String
            if query["locations"].is_a? String
                # Delete since the params are exactly same
                if(params["locations"] == query["locations"])
                    query.delete("locations")
                elsif( (query["locations"].split(",") & params["locations"].split(",")).size > 0 )
                    _new_loc = query["locations"].split(",")
                    _new_loc.delete(params["locations"])
                    query["locations"] = _new_loc.join(",")
                else
                    _new_loc = query["locations"].split(",")
                    _new_loc.append(params["locations"])
                    query["locations"] = _new_loc.join(",")
                end

            else
                
                _new_loc = []
                _new_loc.append(params["locations"])
                query["locations"] = _new_loc.join(",")

            end
        end

        # Categories
        if params["categories"].is_a? String

            if query["categories"].is_a? String
                
                # Delete since the params are exactly same
                if(params["categories"] == query["categories"])
                    query.delete("categories")

                elsif( (query["categories"].split(",") & params["categories"].split(",")).size > 0 )
                    _new_cat = query["categories"].split(",")
                    _new_cat.delete(params["categories"])
                    query["categories"] = _new_cat.join(",")
                else
                    _new_cat = query["categories"].split(",")
                    _new_cat.append(params["categories"])
                    query["categories"] = _new_cat.join(",")
                end

            else
                
                _new_cat = []
                _new_cat.append(params["categories"])
                query["categories"] = _new_cat.join(",")
            end

        end

        query

    end

    def overide_url_params (params) 
        uri = URI.parse(request.fullpath)
        query = Rack::Utils.parse_nested_query(uri.query)

        # Locaiton
        if params["locations"].is_a? String
            # Delete since the params are exactly same
            if((query["locations"].is_a? String) && params["locations"] == query["locations"])
                query.delete("locations")
            else
                _new_loc = []
                _new_loc.append(params["locations"])
                query["locations"] = _new_loc.join(",")
            end
        end

        # Categories
        if params["categories"].is_a? String

            # Delete since the params are exactly same
            if((query["categories"].is_a? String) && params["categories"] == query["categories"])
                query.delete("categories")
            else
                _new_cat = []
                _new_cat.append(params["categories"])
                query["categories"] = _new_cat.join(",")
            end
            
        end

        query

    end

    
end
