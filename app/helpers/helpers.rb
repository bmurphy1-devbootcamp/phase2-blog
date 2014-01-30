helpers do
  def show_tags(post)
    tag_names = []
    post.tags.each do |tag|
      tag_names << tag.name
    end
    tag_names.join(", ")
  end

  def string_to_tag_objects(string)
    tag_records = []
    params[:tags].split(",").map(&:strip).each do |tag_name|
      tag_records << Tag.find_or_create_by_name(tag_name)
    end
    tag_records
  end
end
