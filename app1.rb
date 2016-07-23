require 'sinatra'

get '/' do
  File.read 'index.html'
end

get '/styles.css' do
  content_type 'text/css' # Tell Sinatra that this is not HTML

  File.read 'styles.css'
end

# NOTE: (/) allows access with or without trailing slash
# http://www.sinatrarb.com/faq.html#slash
get '/about/?' do
  File.read 'about.html'
end
