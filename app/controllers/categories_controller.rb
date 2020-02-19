class CategoriesController < ApplicationController


  def index
    @parents = Category.all.order("id ASC").limit(13)
    @tops = Category.where(ancestry: "1/2")
    @jakets = Category.where(ancestry: "1/21")
    @pants = Category.where(ancestry: "1/43")
    @skirts = Category.where(ancestry: "1/56")
    @onepieces = Category.where(ancestry: "1/62")
  end
  
end
