class PreviewController < ArticleController
  def new
    @preview = Article.new(article_params)
    byebug
  end
end