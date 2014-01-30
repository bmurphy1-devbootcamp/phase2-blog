get '/tags' do
  @tags = Tag.all
  erb :tags
end

get '/tags/:name' do
  @tag = Tag.find_by_name(params[:name])
  erb :show_tag
end
