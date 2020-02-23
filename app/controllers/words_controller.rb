class WordsController < AdminController
    def index
        @words = Word.order(:name)
        @themes = Theme.all
        gon.themes = @themes
        gon.admin = true
        gon.language = 'français'
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
            redirect_to words_path, flash: { error: "Une erreur est survenue"}
        end
    end

    def create
        @word = Word.new(word_params)
        if @word.save
            redirect_to words_path, flash: { success: "Ajouté avec succès"}
            return
        else
            redirect_to words_path, flash: { error: "Une erreur est survenue" }
            return
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
        params[:word][:theme_id] = Theme.get_id(params[:word][:theme])
        permitted = params.require(:word).permit(:name, :translation, :theme_id)
        permitted
    end
end