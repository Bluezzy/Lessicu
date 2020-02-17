class WordsController < AdminController
    def index
        @words = Word.order(:name)
    end

    def show
        @word = Word.find(params[:id])
    end

    def edit
        @word = Word.find(params[:id])
    end

    def update
        @word = Word.find(params[:id])
        if @word.update_attributes(word_params)
            redirect_to words_path, flash: { success: "Modifié avec succès" }
        else
            redirect_to words_path,  flash: { error: "Une erreur est survenue"}
        end
    end

    def create
        @word = Word.new(word_params)
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

    protected

    def word_params
        params[:word][:theme_id] = Theme.find_by(name: params[:word][:theme]).id
        permitted = params.require(:word).permit(:name, :translation, :theme_id)
        permitted
    end
end