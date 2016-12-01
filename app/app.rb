ENV["RACK_ENV"] ||= "development"

require './app/models/link.rb'
require 'sinatra/base'


class BookmarkManager < Sinatra::Base
  get '/' do
    erb :intro
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title], tag: params[:tag])
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
