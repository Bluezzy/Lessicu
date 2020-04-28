class ArticlesController < AdminController
    def index
        if params[:category]
            category_name = params[:category]
            category_id = Category.get_id(category_name)
            @articles = Article.where("category_id = ?", category_id)
        else
            @articles = Article.all
        end

        @categories = Category.all
        gon.articles = @articles
        gon.categories = @categories
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update_attributes(article_params)
            redirect_to articles_path, flash: { success: "Modifié avec succès" }
        else
            redirect_to articles_path,  flash: { error: "Une erreur est survenue"}
        end
    end

    def create
        @article = Article.new(article_params)
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

    def article_params
        params[:article][:category_id] = Category.get_id(params[:article][:category])
        permitted = params.require(:article).permit(:author, :title, :content, :image, :heading, :category_id)
        permitted
    end
end