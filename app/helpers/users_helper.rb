module UsersHelper
  def new_image(item)
    new_image = @images.find_by(item_id: item.id)
  end

  def like_item_image(item)
    @image = Image.find_by(item_id: item.id)
  end

  def buyed_item_image(item)
    @image = Image.find_by(item_id: item.id)
  end

end