class ArticlesController < AdminController
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update_attributes(params.require(:article).permit(:author, :title, :content, :category))
            redirect_to articles_path, flash: { success: "Modifié avec succès" }
        else
            redirect_to articles_path,  flash: { error: "Une erreur est survenue"}
        end
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :content, :author, :category))
        if @article.save
            redirect_to articles_path, flash: { success: "Ajouté avec succès" }
        else
            redirect_to articles_path, flash: { error: "Une erreur est survenue" }
        end
    end

    def new
        @article = Article.new
    end

    def destroy
        Article.destroy(params[:id])
        redirect_to articles_path, flash: { success: "Supprimé avec succès" }
    end
end