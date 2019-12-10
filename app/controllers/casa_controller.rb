class CasaController < ApplicationController
    def index
    end

    def search
        query = params[:query]
        @words = Word.start_with(query)
        render json: @words
    end
end