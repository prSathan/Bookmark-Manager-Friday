ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/link.rb'
require_relative 'models/tag.rb'


class BookmarkManager < Sinatra::Base

  get '/links' do
    p @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/add_bookmarks')
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end

end
