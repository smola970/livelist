class PagesController < ApplicationController

  def index
  end

  def about
  end

  def browse_global

    @goals = Goal.all
    @goals_to_do = Goal.where(:complete => false).order("created_at").reverse
    @goals_completed = Goal.where(:complete => true).order("updated_at").reverse
  end

  def friends
    client = Instagram.client(:access_token => session[:access_token])
    following_users = current_user.all_follows
    following_ids = []
    following_users.each do |user|
      following_ids << user.followable_id
    end
    @friends =[]
    following_ids.each do |id|
    @friends << User.where(:user_id => id)
    end
  end

end