class LessicuController < ApplicationController
    before_action :setup

    def index
        @words = Word.order(:name).page params[:page]
        gon.language = 'français'
    end

    def cor
        @words = Word.order(:translation).page params[:page]
        gon.language = 'corsu'
    end

    protected

    def setup
        @themes = Theme.all
        gon.themes = @themes
        gon.admin = admin?
    end
end
