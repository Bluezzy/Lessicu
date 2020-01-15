class WordsController < ApplicationController
    def index
        @words = Word.all
    end

    def show
        @word = Word.find(params[:id])
    end

    def edit
        @word = Word.find(params[:id])
    end

    def update
        @word = Word.find(params[:id])
        if @word.update_attributes(params.require(:word).permit(:name, :translation, :category))
            redirect_to words_path, flash: { success: "Modifié avec succès" }
        else
            redorect_to words_path,  flash: { error: "Une erreur est survenue"}
        end
    end

    def create
        @word = Word.new(params.require(:word).permit(:name, :translation, :category))
        if @word.save
            puts "it worked"
        else
            puts "it didn't work"
        end
    end

    def new
        @word = Word.new
    end
end