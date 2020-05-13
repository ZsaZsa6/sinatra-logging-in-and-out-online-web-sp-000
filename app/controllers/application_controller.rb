require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
      # "Welcome, <%=@user.username%>!"
    end
      redirect erb :error

    end


  end

  get '/account' do
    if self.is_logged_in? == false
      redirect erb :error
    end
    # if self.is_logged_in? == true


  get '/logout' do
    @session.clear

  end


end
