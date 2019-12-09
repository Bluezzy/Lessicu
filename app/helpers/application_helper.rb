module ApplicationHelper
    def alphabet
        'a'.upto('z').to_a.map(&:upcase)
    end
end
