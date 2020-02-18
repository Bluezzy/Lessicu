module ApplicationHelper
    def alphabet
        'a'.upto('z').to_a.map(&:upcase)
    end

    def format_date(date)
        jour = format_day(date.day)
        mois = format_month(date.month)
        annee = format_year(date.year)
        return jour + " " + mois + " " + annee
    end

    def format_day(day)
        if day <= 9
            return "0" + day.to_s
        end
        day.to_s
    end

    def format_month(month)
        case month
        when 1 then return 'janvier'
        when 2 then return 'février'
        when 3 then return 'mars'
        when 4 then return 'avril'
        when 5 then return 'mai'
        when 6 then return 'juin'
        when 7 then return 'juillet'
        when 8 then return 'août'
        when 9 then return 'septembre'
        when 10 then return 'octobre'
        when 11 then return 'novembre'
        when 12 then return 'décembre'
        end
    end

    def format_year(year)
        year.to_s
    end

    def get_theme_names
        result = []
        themes = Theme.all.to_a
        0.upto(themes.length - 1) do |i|
            result.push(themes[i].name)
        end
        result
    end

    def get_theme_id(theme_name)
        Theme.find_by(name: theme_name).id
    end

    def get_theme_names_and_all
        get_theme_names.unshift("all")
    end
end

