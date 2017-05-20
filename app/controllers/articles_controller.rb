class ArticlesController < ApplicationController
    before_action :admin_user, only: [:destroy, :edit, :create, :new, :new_link]
    
    def show
        @article = Article.find(params[:id])
        @videos = Video.all
    end 
    
    def new
        @article = Article.new
    end
    
    def new_link
        @video = Video.new(video_params) unless params[:video].nil?
        @quote = Qoute.new(quote_params) unless params[:quote].nil?
        @userpanel_content = Userpanel.new(userpanel_params) unless params[:userpanel].nil?
        if @video && @video.save
            flash[:success] = "Youtube Video Link Added!"
            redirect_to '/adminpanel'
        elsif @quote && @quote.save
            flash[:success] = "New Daily Quote Added!"
            redirect_to '/adminpanel'
        elsif @userpanel_content && @userpanel_content.save
            flash[:success] = "UserPanel content added!"
            redirect_to '/adminpanel'
        else    
            redirect_to '/adminpanel'
        end

        #if @quote.save 
        #    flash[:success] = "Quote Successfully Added"
        #else
        #    flash[:danger] = "Error: Daily Quote not added"
        #    render 'new'
        #end
    end
    
    def index
        @articles = Article.all.sort_by{| likes | likes.thumbs_up_total}.reverse
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
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end    
        end
    end
    
    def destroy
       Article.find(params[:id]).destroy
       flash[:success] = "Article deleted successfully"
       redirect_to articles_url
    end
    
    #def add_quote
    #  @quote = Quote.new(quote_params) 
    #  if @quote.save 
    #      flash[:success] = "Quote Successfully Added"
    #  else
    #      flash[:danger] = "Error: Daily Quote not added"
    #      render 'new'
    #  end
    #end
    
    def edit_quote
        
    end
    
    def like
        @article = Article.find(params[:id])
        if logged_in?
            like = Like.create(likes: params[:like], user: current_user, article: @article)
            if like.valid?
                flash[:success] = "Your selection was successful"
                redirect_to :back
            else
                flash[:danger] = "You can not select more than once"
                redirect_to :back
            end
        else
            flash[:warning] = "Please Login"
            redirect_to :back
        end
    end
    
    def comment
        @article = Article.find(params[:id])
        Comment.create(comment: params[:comment], user: current_user, article: @article)
        redirect_to :back
    end
    
    private 
    
    def article_params
        params.require(:article).permit(:title, :text, :liked, :author_name,
                                  :image_link, :picture)
    end
    
    def userpanel_params
        params.require(:userpanel).permit(:user_id, :user_video, :html_video, :css_video, 
        :js_video, :ror_video, :other_video, :exercise, :html_exercise, :css_exercise,
        :js_exercise, :ror_exercise, :other_exercise, :project, :final_project, :course,
        :html_course, :css_course, :js_course, :ror_course, :other_course, :complete,
        :free, :location)
    end
    
    def video_params
        params.require(:video).permit(:link)
    end
    
    def quote_params
       params.require(:quote).permit(:quote, :author) 
    end
    
    def admin_user
        redirect_to(root_url) && flash[:danger] = 'forbidden' unless current_user && current_user.admin?
    end
    
end
