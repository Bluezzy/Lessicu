class LessicuController < ApplicationController
    def index
        @words = Word.all
        @themes = Theme.all
        gon.themes = @themes
    end
end
