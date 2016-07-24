require 'sinatra'

get '/' do
  # NOTE: this must be a Symbol, otherwise it is interpreted as a String
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
