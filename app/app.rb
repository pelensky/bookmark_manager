ENV["RACK_ENV"] ||= "development"

require './app/models/link.rb'
require './app/models/tagged_value.rb'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

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
    split_tags = params[:tag].split(",").map {|i| i.strip}
    split_tags.each do |tag|
      record = TaggedValue.create(tag: tag)
      link.tagged_value << record
    end
    link.save
    redirect '/links'
  end

  post '/tags' do
    filter_test = TaggedValue.first(:tag => params[:filter_by_tag])
    @links1 = filter_test ? filter_test.links : []
    erb :'links/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/links')
    else
      flash.now[:notice] = "Password and confirmation do not match. Please try again"
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
