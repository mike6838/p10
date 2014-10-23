get '/' do
  erb :index
end

# Renders Sign in partial
get '/sessions/new' do
  erb :_signin
end

# Sign in
post '/sessions/new' do
  user = User.find_by_email(params[:email])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/'
  end
end

# Sign out
delete '/sessions/:id' do
  session.clear
  redirect '/'
end

# Renders Sign Up Partial
get '/users/new' do
  if session[:errors]
    @errors = session[:errors]
    # session[:errors] = []
  end
  erb :_signup
end

# Sign up
post '/users' do
  user = User.create(params[:user])
  user.password = params[:user][:password]
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    session[:errors] = user.errors
    redirect '/users/new'
  end
end

# Post Comment
post '/comment' do
  Comment.create(params)
  redirect '/'
end