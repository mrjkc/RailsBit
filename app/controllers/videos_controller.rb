class VideosController < ApplicationController
    before_action :admin_user, only: [:destroy]
    
    def show
        @video = Video.find(params[:id])
        @articles = Article.all
        @comments = Comment.joins(:video).where({video_id: @video.id})
    end
    
    def index 
       @videos = Video.paginate(page: params[:page], per_page: 9)
    end
    
    def destroy
       Video.find(params[:id]).destroy
       flash[:success] = "Video Deleted Successfully"
       redirect_to videos_url
    end
    
    def like
        @video = Video.find(params[:id])
        if logged_in?
            like = Like.create(likes: params[:like], user: current_user, video: @video)
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
        @video = Video.find(params[:id])
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
    
    def admin_user
       redirect_to(root_url) unless current_user.admin? 
    end
    
    def comment_params
        params.require(:comment).permit(:comment, :user_id, :article_id, :video_id)
    end
end
