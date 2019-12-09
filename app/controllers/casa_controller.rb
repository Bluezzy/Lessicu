class CasaController < ApplicationController
    def index
    end

    def json
        @words = Word.all
        render json: @words
    end
end