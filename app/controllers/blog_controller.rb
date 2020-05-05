class BlogController < ApplicationController
  def index
    if params[:category]
        category_name = params[:category]
        category_id = Category.get_id(category_name)
        @articles = Article.where("category_id = ?", category_id).order(creatd_at: :desc).page params[:page]
    else
        @articles = Article.order(created_at: :desc).page params[:page]
    end

    @categories = Category.all
    gon.articles = @articles
    gon.categories = @categories
end

  def show
      @article = Article.find(params[:id])
  end
end
