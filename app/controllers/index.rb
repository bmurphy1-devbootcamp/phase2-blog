get '/' do
  @posts = Post.all
  erb :posts
end
