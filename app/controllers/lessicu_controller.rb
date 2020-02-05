class LessicuController < ApplicationController
    def index
        @words = Word.all
    end
end
