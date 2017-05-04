class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :index, :destroy] 
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user, only: :destroy
    respond_to :js, :html
    
    def index
       @users = User.paginate(page: params[:page]) 
    end
    
    def show
        @user = User.find(params[:id])
        user_since_array = (@user.created_at).to_s.split(" ")
        @user_since = user_since_array[0]
    end
    
    def new
        @user = User.new
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end
    
    def create
       @user = User.new(user_params) 
       if @user.save
           # do shit
           log_in @user
           flash[:success] = "Welcome to RailsBit.com"
           #redirect_to '/userpanel'
           popup_method()
       else
           render 'new'
       end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
       @user = User.find(params[:id])
       if @user.update_attributes(user_params)
           flash[:success] = "User Updated Successfully!"
           redirect_to @user
       else
           render 'edit'
       end
    end
    
    def panel
        
    end 
    
    private
        def popup_method
            respond_to do |format|
                format.html { redirect_to '/userpanel' }
                sleep(2)
                puts "rendering javascript..."
                format.js { 
                            render :js => "custom_javascript/popup.js", 
                                   :layout => false  
                 }
            end
        end
        
        def user_params
           params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
        
        #confirms a logged in user
        def logged_in_user
            unless logged_in?
                store_location
                flash[:danger] = 'Please Log in'
                redirect_to login_url
            end    
        end 
        
        def correct_user
           @user = User.find(params[:id])
           redirect_to(root_url) unless current_user?(@user)
        end
        
        # Confirms an admin user.
        def admin_user
            redirect_to(root_url) unless current_user.admin?
        end
end
