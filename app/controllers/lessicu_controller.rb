class LessicuController < ApplicationController
    before_action :setup

    def index
        gon.language = 'français'
    end

    def cor
        gon.language = 'corsu'
    end

    protected

    def setup
        @words = Word.all
        @themes = Theme.all
        gon.themes = @themes
        gon.admin = false
    end
end
