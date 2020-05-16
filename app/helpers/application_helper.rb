module ApplicationHelper
    def alphabet
        'a'.upto('z').to_a.map(&:upcase)
    end

    def alphabet_corse
        ['A', 'B', 'C', 'Chj', 'D', 'E', 'F', 'G', 'Ghj', 'I', 'J', 'L', 'M', 'N', 'O', 'P',
         'Q', 'R', 'S', 'T', 'U', 'V', 'Z' ]
    end

    def get_names(anyModel, firstToAppear = false)
        result = firstToAppear ? [firstToAppear] : []
        names = anyModel.all.to_a
        0.upto(names.length - 1) do |i|
            result.push(names[i].name)
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