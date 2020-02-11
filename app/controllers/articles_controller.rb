class ArticlesController < AdminController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Word.find(params[:id])
    end

    def update
        @article = Word.find(params[:id])
        if @article.update_attributes(params.require(:article).permit(:author, :title, :content, :category))
            redirect_to articles_path, flash: { success: "Modifié avec succès" }
        else
            redirect_to articles_path,  flash: { error: "Une erreur est survenue"}
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