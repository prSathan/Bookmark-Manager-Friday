require 'sinatra/base'
require_relative '../lib/link.rb'

class BookmarkManager < Sinatra::Base

  get '/' do

  end

  get '/links' do
    @links = Link.all
    erb(':links/index')
  end

end
