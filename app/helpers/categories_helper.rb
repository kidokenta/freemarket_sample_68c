module CategoriesHelper

  def category_aaa(parent)
    @bbb = parent.id
    @bbb += 1
    @next_parent = Category.find_by(id: @bbb)
    @ppp = @next_parent.ancestry
    @vvv = Category.where(ancestry: @ppp)
  end
  def category_bbb(parent2)
    @bbb2 = parent2.id
    @bbb2 += 2
    @next_parent2 = Category.find_by(id: @bbb2)
    @ppp2 = @next_parent2.ancestry
    @vvv2 = Category.where(ancestry: @ppp2)
  end

end