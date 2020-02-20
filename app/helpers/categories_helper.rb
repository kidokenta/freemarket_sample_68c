module CategoriesHelper

  def category_aaa(parent)
    @bbb = parent.id
    @bbb += 1
    @next_parent = Category.find_by(id: @bbb)
    @ppp = @next_parent.ancestry
    @vvv = Category.where(ancestry: @ppp)
  end
end
