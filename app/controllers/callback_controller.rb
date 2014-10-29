class CallbackController < ApplicationController





  def auth
    '<a href="/oauth/connect">Connect with Instagram</a>'
  end

  def connect
    Instagram.configure do |config|
      config.client_id = "b76260d1f4c14d6ebbaaa66890fdeb8a"
      config.client_secret = "d4ebeb21e23f492abf1488984bed080d"
      # For secured endpoints only
      #config.client_ips = '<Comma separated list of IPs>'
    end
    callback_url = "http://localhost:3000/oauth/callback"
    redirect_to Instagram.authorize_url(:redirect_uri => callback_url)

  end

  def callback
    callback_url = "http://localhost:3000/oauth/callback"
    response = Instagram.get_access_token(params[:code], :redirect_uri => callback_url)
    current_user.update(:instagram_username => response.user.username, :instagram_id => response.user.id.to_i, :instagram_profile_image => response.user.profile_picture )
    current_user.save
    session[:access_token] = response.access_token
    redirect_to '/friends'

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


    # config.client_id = "b76260d1f4c14d6ebbaaa66890fdeb8a"

    # config.access_token = "1542200907.b76260d.73f500b6f24d41d3a12d12e38ab52180"