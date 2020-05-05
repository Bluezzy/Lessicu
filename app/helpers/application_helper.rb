module ApplicationHelper
    def alphabet
        'a'.upto('z').to_a.map(&:upcase)
    end

    def alphabet_corse
        ['A', 'B', 'C', 'CHJ', 'D', 'E', 'F', 'G', 'GHJ', 'I', 'J', 'L', 'M', 'N', 'O', 'P',
         'Q', 'R', 'S', 'T', 'U', 'V', 'Z' ]
    end

    def get_names(anyModel, firstToAppear)
        result = [firstToAppear]
        themes = anyModel.all.to_a
        0.upto(themes.length - 1) do |i|
            result.push(themes[i].name)
        end
        result.uniq
    end

    def get_theme_id(theme_name)
        Theme.find_by(name: theme_name).id
    end

    def get_theme_names_and_all
        get_names(Theme).unshift("all")
    end
end