class ArticlesTheme < ApplicationRecord
    def get_article
        Article.find(self.article_id)
    end

    def get_theme
        Theme.find(self.theme_id)
    end
end
