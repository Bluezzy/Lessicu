class GlossaryController < ApplicationController
    def search
        query = params[:query]
        @words = Word.start_with(query, "français").order(:name).page params[:page]
        render json: @words
    end

    def circa
        query = params[:query]
        @words = Word.start_with(query, "corsu").order(:translation).page params[:page]
        render json: @words
    end
end