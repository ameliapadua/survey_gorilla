enable 'sessions'

get '/' do
  if session[:id]
    @user = User.find(session[:id])
  end
  erb :index
end

get '/login' do
  erb :login
end

post '/verify' do
  @user = User.where(name: params[:name], password: params[:password]).first
  if @user
    session[:user_id] = @user.id
    redirect "/user/#{session[:user_id]}"
  else
    redirect '/login'
  end
end

post '/register' do
  @user = User.create(name: params[:name], password: params[:password], email: params[:email])
  session[:user_id] = @user.id
  redirect "/users/#{session[:user_id]}"
end

get '/user/:user_id' do
  @user = User.find(session[:user_id])
  erb :'user/show_user'
end