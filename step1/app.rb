require 'sinatra'

get '/' do
  File.read 'index.html'
end

# NOTE: (/) allows access with or without trailing slash
# http://www.sinatrarb.com/faq.html#slash
get '/about/?' do
  File.read 'about.html'
end
