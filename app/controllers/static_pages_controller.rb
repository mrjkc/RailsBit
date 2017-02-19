class StaticPagesController < ApplicationController
    
    def home
        @articles = Article.all
    end
    
    def backend
        @articles = Article.all
    end
end
