class ArticlesController < ApplicationController
    before_action :authorize, except: [:index, :show]

    def index
        if params[:category]
            category_name = params[:category]
            category_id = Category.get_id(category_name)
            @articles = Article.where(published: true)
                                .where("category_id = ?", category_id)
                                .order(created_at: :desc)
                                .page params[:page]
        else
            @articles = Article.where(published: true)
                               .order(created_at: :desc)
                               .page params[:page]
        end
    
        @categories = Category.all
        @drafts = false
        gon.articles = @articles
        gon.categories = @categories
    end

    def drafts
        if params[:category]
            category_name = params[:category]
            category_id = Category.get_id(category_name)
            @articles = Article.where(published: false)
                                .where("category_id = ?", category_id)
                                .order(created_at: :desc)
                                .page params[:page]
        else
            @articles = Article.where(published: false)
                               .order(created_at: :desc)
                               .page params[:page]
        end
    
        @categories = Category.all
        @drafts = true
        gon.articles = @articles
        gon.categories = @categories
        render 'index'
    end
    
    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def publish
        @article= Article.find(params[:id])
        @article.created_at = Time.zone.now
        permitted = params.require(:article).permit(:published, :created_at)
        if @article.update_attributes(permitted)
            redirect_to articles_path, flash: { success: "Article publié avec succès"}
        else
            redirect_to @article, flash: { error: "Une erreur est survenue"}
        end
    end

    def update
        @article = Article.find(params[:id])
        if @article.update_attributes(article_params)
            redirect_to article_path(@article), flash: { success: "Modifié avec succès" }
        else
            redirect_to articles_path, flash: { error: "Une erreur est survenue" }
        end
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to article_path(@article), flash: { success: "Ajouté avec succès" }
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