class WordsController < ApplicationController
    def index
        @words = Word.order(:category).order(:name)
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
            redirect_to words_path, flash: { success: "Ajouté avec succès" }
        else
            redirect_to words_path, flash: { error: "Une erreur est survenue" }
        end
    end

    def new
        @word = Word.new
    end

    def destroy
        Word.destroy(params[:id])
        redirect_to words_path, flash: { success: "Supprimé avec succès" }
    end
end