require 'sinatra'

get '/' do
  # NOTE: this must be a Symbol, otherwise it expects a String template
  erb :index, layout: :layout
end

get '/styles.css' do
  content_type 'text/css' # Tell Sinatra that this is not HTML

  File.read 'styles.css'
end

# NOTE: (/) allows access with or without trailing slash
# http://www.sinatrarb.com/faq.html#slash
get '/about/?' do
  erb :about, layout: :layout
end

get '/welcome/:name/?' do
  erb "<h1>Welcome to my site #{params[:name]}</h1>"
end
