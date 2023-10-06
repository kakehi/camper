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

    def insert_url_params (params, override = false) 
        uri = URI.parse(request.fullpath)
        query = Rack::Utils.parse_nested_query(uri.query)

        # Locaiton
        if params["locations"].is_a? String
            if query["locations"].is_a? String
                # Delete since the params are exactly same
                if(params["locations"] == query["locations"])
                    query.delete("locations")
                elsif( (query["locations"].split(",") && params["locations"].split(",")).size > 0 )
                    _new_loc = query["locations"].split(",")
                    _new_loc.delete(params["locations"])
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

        # query.delete('fuga')
        # uri.query = query.to_param
        # uri.to_s
        
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

        # query.delete('fuga')
        # uri.query = query.to_param
        # uri.to_s
        
    end

    
end
