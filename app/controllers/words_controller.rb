class WordsController < ApplicationController
    def index
    end

    def show
        @word = Word.find(params[:id])
    end
end