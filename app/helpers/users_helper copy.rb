module UsersHelper
  def new_image(item)
    new_image = @images.find_by(item_id: item.id)
  end

end