require 'sinatra'
enable :sessions
set :session_secret, 'OOGDYPEITMZAREJLOGCMXDLXIXQAOUTHGGPKBICW'

PASSWORD = "foo"

post('/login') do
  if params[:password] == PASSWORD
    session[:logged_in] = true
  end
end


get('/hello') do
  @message = params[:message] || "Default Message"
  @time = get_time
  erb :index
end

post('/send_message') do
  @message = params[:message]

  redirect "/hello?message=#{@message}"
end

def get_time
  Time.now
end
