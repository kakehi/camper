module ScheduleActivitiesHelper

    def schedule_summer_templates
        [
            {
                year: 2023,
                weeks: [
                    {
                        start_at: Date.new(2023, 6, 12),
                        end_at: Date.new(2023, 6, 16)
                    },
                    {
                        start_at: Date.new(2023, 6, 19),
                        end_at: Date.new(2023, 6, 23)
                    },
                    {
                        start_at: Date.new(2023, 6, 26),
                        end_at: Date.new(2023, 6, 30)
                    },
                    {
                        start_at: Date.new(2023, 7, 3),
                        end_at: Date.new(2023, 7, 7)
                    },
                    {
                        start_at: Date.new(2023, 7, 10),
                        end_at: Date.new(2023, 7, 14)
                    },
                    {
                        start_at: Date.new(2023, 7, 17),
                        end_at: Date.new(2023, 7, 21)
                    },
                    {
                        start_at: Date.new(2023, 7, 24),
                        end_at: Date.new(2023, 7, 28)
                    },
                    {
                        start_at: Date.new(2023, 7, 31),
                        end_at: Date.new(2023, 8, 4)
                    },
                    {
                        start_at: Date.new(2023, 8, 7),
                        end_at: Date.new(2023, 8, 11)
                    },
                    {
                        start_at: Date.new(2023, 8, 14),
                        end_at: Date.new(2023, 8, 18)
                    },
                    {
                        start_at: Date.new(2023, 8, 21),
                        end_at: Date.new(2023, 8, 25)
                    },
                    {
                        start_at: Date.new(2023, 8, 28),
                        end_at: Date.new(2023, 9, 1)
                    }
                ]
            }
        ]        
    end

    def get_summer_templates(years)
        schedule_summer_templates.select{|e| years.select{|y| y == e[:year]}.count > 0} 
    end

    def get_current_summer
        get_summer_templates([2023]).first()
    end

    def dates_overlap?(a, b)
        if defined?(a[:start_at]) && defined?(a[:end_at])
            (b[:start_at] <= a[:start_at] && a[:start_at] <= b[:end_at]) ||
            (a[:end_at] <= b[:end_at] && b[:start_at] <= a[:end_at]) ||
            (a[:start_at] <= b[:start_at] && b[:start_at] <= a[:end_at]) ||
            (b[:end_at] <= a[:end_at] && a[:start_at] <= b[:end_at])
        else
            false
        end
        
    end
end
