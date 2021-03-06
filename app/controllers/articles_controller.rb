# Articles controller should be separated in to different controllers, one
# controller per Model
class ArticlesController < ApplicationController
  before_action :admin_user, only: [:destroy, :edit, :create, :new, :new_link]

  def show
    @article = Article.find(params[:id])
    @videos = Video.all
    @comments = Comment.joins(:article).where({article_id: @article.id})
  end

  def new
    @article = Article.new
  end

  # addd admin panel content
  def new_link
    admin_redirect_link = '/adminpanel'
    @video = Video.new(video_params) unless params[:video].nil?
    @quote = Qoute.new(quote_params) unless params[:quote].nil?
    @userpanel_content = Userpanel.new(userpanel_params) unless params[:userpanel].nil?
    if @video && @video.save
      flash[:success] = 'Youtube Video Link Added!'
      redirect_to admin_redirect_link
    elsif @quote && @quote.save
      flash[:success] = 'New Daily Quote Added!'
      redirect_to admin_redirect_link
    elsif @userpanel_content && @userpanel_content.save
      flash[:success] = 'UserPanel content added!'
      redirect_to admin_redirect_link
    else
      redirect_to admin_redirect_link
    end
  end

  def index
    @articles = Article.all.sort_by{| likes | likes.thumbs_up_total}.reverse
  end

  # create new article action
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Article Saved!'
      redirect_to @article
    else
      ender 'new'
    end
  end

  # edit article action
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

  def edit_quote; end

  # Like an article
  def like
    @article = Article.find(params[:id])
    if logged_in?
      like = Like.create(likes: params[:like], user: current_user, article: @article)
      if like.valid?
        redirect_to :back
      else
        flash[:danger] = 'You can not select more than once'
        redirect_to :back
      end
    else
      flash[:warning] = 'Please Login'
      redirect_to :back
    end
  end

  def comment
    @article = Article.find(params[:id])
    if logged_in?
      @comment = Comment.create(comment_params)
      if @comment.save
        flash[:success] = "Comment Added"
        redirect_to :back
      else
        redirect_to :back
      end
    else
      flash[:danger] = "You must login in order to comment"
      redirect_to :back
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :liked, :author_name,
                                    :image_link, :picture)
  end

  def userpanel_params
    params.require(:userpanel).permit(:user_id, :user_video, :html_video,
                                      :css_video, :js_video, :ror_video,
                                      :other_video, :exercise, :html_exercise,
                                      :css_exercise, :js_exercise, :ror_exercise, 
                                      :other_exercise, :project, :final_project,
                                      :course, :html_course, :css_course,
                                      :js_course, :ror_course, :other_course,
                                      :complete, :free, :location)
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

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :article_id, :video_id)
  end
end
