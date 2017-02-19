class ArticlesController < ApplicationController
    
    def show
        @article = Article.find(params[:id])
    end 
    
    def new
        @article = Article.new
    end
    
    def index
        @articles = Article.all
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:succes] = "Article Saved!"
            redirect_to @article
        else
            render 'new'
        end
    end
    
    private 
    
    def article_params
        params.require(:article).permit(:title, :text, :liked, :author_name,
                                  :image_link)
    end
    
end
