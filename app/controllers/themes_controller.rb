class ThemesController < ApplicationController
  def index
      @themes = Theme.all
  end

  def show
      @wtheme = Theme.find(params[:id])
  end

  def edit
      @theme = Theme.find(params[:id])
  end

  def update
      @theme = Theme.find(params[:id])
      if @Theme.update_attributes(params.require(:theme).permit(:name))
          redirect_to themes_path, flash: { success: "Modifié avec succès" }
      else
          redirect_to themes_path,  flash: { error: "Une erreur est survenue"}
      end
  end

  def create
      @theme = Theme.new(params.require(:theme).permit(:name))
      if @theme.save
          redirect_to themes_path, flash: { success: "Ajouté avec succès" }
      else
          redirect_to themes_path, flash: { error: "Une erreur est survenue" }
      end
  end

  def new
      @theme = Theme.new
  end

  def destroy
      Theme.destroy(params[:id])
      redirect_to themes_path, flash: { success: "Supprimé avec succès" }
  end
end
