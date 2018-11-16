require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    binding.pry
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.create(:name => params[:post_name], :content => params[:post_content])
    redirect to '/posts'
  end
end
