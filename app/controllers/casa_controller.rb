class CasaController < ApplicationController
    def index
    end

    def search
        query = params[:query]
        @words = Word.start_with(query, "français")
        render json: @words
    end

    def circa
        query = params[:query]
        @words = Word.start_with(query, "corsu")
        render json: @words
    end
end