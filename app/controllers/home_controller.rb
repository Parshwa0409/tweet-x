class HomeController < ApplicationController
  def index

    @all_tweets = []

    user = User.find_by(id:session[:user_id])

    if user.present?
      user_followings = user.followings.pluck(:following_user_email).map {|email_id| User.find_by(email:email_id)}
      user_followings.each do |user|
        user.tweets.each { |t| @all_tweets << t}
      end
    end

  end
end
