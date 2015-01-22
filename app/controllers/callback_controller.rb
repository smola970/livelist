class CallbackController < ApplicationController

  def auth
    '<a href="/oauth/connect">Connect with Instagram</a>'
  end

  def connect
    Instagram.configure do |config|
      config.client_id = "b76260d1f4c14d6ebbaaa66890fdeb8a"
      config.client_secret = "d4ebeb21e23f492abf1488984bed080d"
    end
    callback_url = "http://localhost:3000/oauth/callback"
    redirect_to Instagram.authorize_url(:redirect_uri => callback_url)
  end

  def callback
    callback_url = "http://localhost:3000/oauth/callback"
    response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
    current_user.update(:instagram_username => response.user.username, :instagram_id => response.user.id.to_i, :instagram_profile_image => response.user.profile_picture )
    if current_user.profile_image_url == nil
      current_user.update(:profile_image_url => response.user.profile_picture)
    end
    current_user.save
    session[:access_token] = response.access_token
    redirect_to '/follow_friends'
  end

  # get "/oauth/connect" do
  #   redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  # end

  # get "/oauth/callback" do
  #   response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  #   session[:access_token] = response.access_token
  #   redirect "/nav"
  # end

end
