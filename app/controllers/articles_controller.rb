class ArticlesController < ApplicationController
    
    def show
        @article = Article.find(params[:id])
    end 
    
    def new
        @article = Article.new
    end
    
    def new_link
        @video = Video.new(video_params)
        if @video.save
            flash[:success] = "Youtube Video Link Added!"
            redirect_to '/articles/new'
        else 
            render 'new'
        end
    end
    
    def index
        @articles = Article.all
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article Saved!"
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def edit
      @article = Article.find(params[:id])  
    end
    
    def update
        @article = Article.find(params[:id])
        respond_to do |format|
            if @article.update(article_params)
                format.html { redirect_to @article, notice: 'Article was successfully updated.' }
                format.json { render :show, status: :ok, location: @article }
            else
                format.html { render :edit }
                format.json { render json: @article.errors, status: :unprocessable_entoty }
            end    
        end
    end
    
    private 
    
    def article_params
        params.require(:article).permit(:title, :text, :liked, :author_name,
                                  :image_link, :picture)
    end
    
    def video_params
        params.require(:video).permit(:link)
    end
    
end
