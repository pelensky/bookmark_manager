ENV["RACK_ENV"] ||= "development"

require './app/models/link.rb'
require 'sinatra/base'


class BookmarkManager < Sinatra::Base
  get '/' do
    erb :intro
  end

  get '/links' do
    @links1 = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tags = TaggedValue.create(tag: params[:tag])
    link.tagged_value << tags
    link.save
    redirect '/links'
  end

  post '/tags' do
    filter_test = TaggedValue.first(:tag => params[:filter_by_tag])
    @links1 = filter_test ? filter_test.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
