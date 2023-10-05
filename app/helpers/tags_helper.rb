module TagsHelper
    def tag_groups
        [
            {
                id: 7,
                name: "Arts & Crafts",
                children: [
                    28, 40, 31, 24, 25
                ]
            },
            {
                id: 8,
                name: "Sports",
                children: [
                    1, 46, 14, 20, 12, 43, 13, 21
                ]
            },
            {
                id: 3,
                name: "STEM",
                children: [
                    2, 5, 4, 36, 16, 53, 15, 9, 54, 56, 57, 58, 59
                ]
            },
            {
                id: 23,
                name: "Music",
                children: [
                    42, 52, 55
                ]
            },
            {
                id: 48,
                name: "Digital art",
                children: [
                    27, 30, 47, 58
                ]
            },
            {
                id: 43,
                name: "Gymnastics",
                children: [
                    44
                ]
            },
            {
                id: 17,
                name: "Theater & Play",
                children: [
                    26, 35, 45, 51, 50
                ]
            },
            {
                id: 22,
                name: "Dance",
                children: [
                    18, 38, 37, 39
                ]
            },
            {
                id: 6,
                name: "With animals",
                children: [
                    12, 11, 59
                ]
            }
        ]
    end

    def tag_get_tags_by_group
        
        selected_tags = []
        _tag_groups = tag_groups.map{|tg_g|
            selected_tags.push(tg_g[:id])
            _tg_g = {
                record: Tag.find_by(id: tg_g[:id]),
                children: tg_g[:children].map{|tg|
                    selected_tags.push(tg)
                    {
                        record: Tag.find_by(id: tg)
                    }
                }
            } 
            _tg_g
        }

        # Others
        _tag_groups = _tag_groups.concat(
            Tag.where.not(id: selected_tags).map{ |t| {record: t} }
        )

        _tag_groups
    end
end
