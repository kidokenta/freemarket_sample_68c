class CategoriesController < ApplicationController
  def index
    @parents  =  Category.where(ancestry: nil).limit(13) #レディース
    @parents_first = Category.where(ancestry: nil)
    
  end
    def create
      @category = @item.categories.new(category_params)
    end
  
    private
    def category_params
      params.require(:category).permit(:category)
    end

end