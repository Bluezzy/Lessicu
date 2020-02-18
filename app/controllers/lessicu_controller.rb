class LessicuController < ApplicationController
    def index
        @words = Word.all
        @themes = Theme.all
    end
end
