require 'sinatra/base'
require_relative '../lib/link.rb'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/add_links')
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect to('/links')

  end

end
