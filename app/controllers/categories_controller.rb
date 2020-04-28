class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
  
    def show
        @category = Category.find(params[:id])
    end
  
    def edit
        @category = Category.find(params[:id])
    end
  
    def update
        @category = Category.find(params[:id])
        if @category.update_attributes(params.require(:category).permit(:name))
            redirect_to categories_path, flash: { success: "Modifié avec succès" }
        else
            redirect_to categories_path,  flash: { error: "Une erreur est survenue"}
        end
    end
  
    def create
        @category = Category.new(params.require(:category).permit(:name))
        if @category.save
            redirect_to categories_path, flash: { success: "Ajouté avec succès" }
        else
            redirect_to categories_path, flash: { error: "Une erreur est survenue" }
        end
    end
  
    def new
        @category = Category.new
    end
  
    def destroy
        Category.destroy(params[:id])
        Article.update_dependent_articles_after_deleted_category(params[:id])
        redirect_to categories_path, flash: { success: "Supprimé avec succès" }
    end
end
