class UserController < ApplicationController
    def search
        @current_user =  User.find_by(id:session[:user_id])
        flash
        @matching_users = []
    end

    def search_user
        @current_user =  User.find_by(id:session[:user_id])

        search_email = params.require(:search).permit(:email)[:email]

        @matching_users = User.where(email:search_email)

        if @matching_users.empty? 
            flash.now[:alert] = "NO SUCH USERS WITH THE EMAIL '#{search_email}' FOUND!!!"
            render :search
        else
            render :search
        end
    end

    def add_user
        @current_user =  User.find_by(id:session[:user_id])

        following_email = params[:email]

        @current_user.followings.create(following_user_email:following_email)
        redirect_to root_path 
    end

    def add_tweet
        @current_user =  User.find_by(id:session[:user_id])
        @tweet = Tweet.new()
    end

    def create_tweet
        @current_user =  User.find_by(id:session[:user_id])
        headline = params[:tweet][:headline]
        tweet =  params[:tweet][:tweet]
         
        if headline!="" && tweet!=""
            @current_user.tweets.create(headline:headline, tweet:tweet)
            redirect_to root_path
        else
            flash.now[:alert]="ALL THE FIELDS MANDATORY !!!"
            render :add_tweet
        end
    
    end

    def profile
        @current_user =  User.find_by(id:session[:user_id])
    end

end
