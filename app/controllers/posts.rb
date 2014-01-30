get '/posts' do
  @posts = Post.all
  erb :posts
end

get '/posts/new' do
  erb :new_post
end

post '/posts/new' do
  p params[:post]
  @post = Post.create(title: params[:title], body: params[:body])
  if @post.valid?
    redirect '/posts/new/error'
  end
  if params[:tags]
    @post.tags << string_to_tag_objects(params[:tags])
  end
  redirect "/posts/#{@post.id}"
end


post '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/posts'
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/posts/:id' do
  @post = Post.find(params[:id])
  @post.title = params[:title]
  @post.body = params[:body]
  @post.tags = string_to_tag_objects(params[:tags])
  @post.save
  redirect "/posts/#{params[:id]}"
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :show_post
end
