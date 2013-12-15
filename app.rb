require 'sinatra'

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
