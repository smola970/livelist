class PagesController < ApplicationController
  skip_before_action :authenticate, :only => [:about]
  def index
    following_users = current_user.all_follows
    following_ids = []
    following_ids << current_user.id
    following_users.each do |user|
      following_ids << user.followable_id
    end
    @goals = Goal.where(:user_id => following_ids)
    @goals_to_do = @goals.where(:complete => false).order("created_at").reverse
    @goals_completed = @goals.where(:complete => true).order("updated_at").reverse
  end

  def about
  end

  def browse_global
    @goals = Goal.all
    @goals_to_do = Goal.where(:complete => false).order("created_at").reverse
    @goals_completed = Goal.where(:complete => true).order("updated_at").reverse
  end

  def follow_friends
    @client = Instagram.client(:access_token => session[:access_token])
    instagram_friends = @client.user_follows.map { |f| f.username }
    @friends_to_follow = []
    User.all.each do |user|
      if instagram_friends.include? user.instagram_username
        @friends_to_follow << user
        current_user.follow(user)
      end
    end
    @count = @friends_to_follow.count
  end
end
