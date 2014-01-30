get '/posts' do
  erb :posts
end

get '/posts/new' do
  erb :new_post
end

post '/posts/new' do
  p params[:post]
  @post = Post.create(title: params["name"], body: params["body"])
  if params[:tags]
    tag_records = []
    params[:tags].split(",").map(&:strip).each do |tag_name|
      tag_records << Tag.find_or_create_by_name(tag_name)
    end
    @post.tags << tag_records
      # find or create a tag
      # create a PostTag object based on tag and post object
      # @tag = Tag.where(name: tag_name).first_or_create
      # PostTag.where(post_id: @post.id, tag_id: @tag.id).first_or_create
  end

  redirect "/posts/#{@post.id}"
end

get '/posts/:id/edit' do
  erb :edit_post
end

post '/posts/:id/edit' do
  redirect '/posts/:id'
end

get '/posts/:id/delete' do
  erb :delete_post
end

post '/posts/:id/delete' do
  erb :post_deleted
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :show_post
end
