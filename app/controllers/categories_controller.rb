class CategoriesController < ApplicationController
  def index
    @parents = Category.all.order("id ASC").limit(13) #レディース
    @tops = Category.where(ancestry: "1/2")
    @jakets = Category.where(ancestry: "1/21")
    @pants = Category.where(ancestry: "1/43")
    @skirts = Category.where(ancestry: "1/56")
    @onepieces = Category.where(ancestry: "1/62")
    @shoes = Category.where(ancestry: "1/67")
    @roomwers = Category.where(ancestry: "1/78")
    @regwers = Category.where(ancestry: "1/81")
    @list1s = Category.where(ancestry: "1/87")
    @list2s = Category.where(ancestry: "1/95")
    @list3s = Category.where(ancestry: "1/114")
    @list4s = Category.where(ancestry: "1/126")
    @list5s = Category.where(ancestry: "1/131")
    @list6s = Category.where(ancestry: "1/155")
    @list7s = Category.where(ancestry: "1/162")
    @list8s = Category.where(ancestry: "1/169")
    @list9s = Category.where(ancestry: "1/178")
    @list10s = Category.where(ancestry: "1/186")
    @list11s = Category.where(ancestry: "1/196")
    @list12s = Category.where(ancestry: "200/201")  #メンズ
    @list13s = Category.where(ancestry: "200/214")
    @list14s = Category.where(ancestry: "200/238")
    @list15s = Category.where(ancestry: "200/248")
    @list16s = Category.where(ancestry: "200/257")
    @list17s = Category.where(ancestry: "200/270")
    @list18s = Category.where(ancestry: "200/276")
    @list19s = Category.where(ancestry: "200/284")
    @list20s = Category.where(ancestry: "200/293")
    @list21s = Category.where(ancestry: "200/323")
    @list22s = Category.where(ancestry: "200/330")
    @list23s = Category.where(ancestry: "200/335")
    @list24s = Category.where(ancestry: "200/340")
    @list25s = Category.where(ancestry: "200/344")
    @list26s = Category.where(ancestry: "346/347") #ベビー・キッズ
    @list27s = Category.where(ancestry: "346/359")
    @list28s = Category.where(ancestry: "346/359")
    @list29s = Category.where(ancestry: "346/368")
    @list30s = Category.where(ancestry: "346/396")
    @list31s = Category.where(ancestry: "346/411")
    @list31s = Category.where(ancestry: "346/420")
    @list32s = Category.where(ancestry: "346/420")
    @list33s = Category.where(ancestry: "346/426")
    @list34s = Category.where(ancestry: "346/441")
    @list35s = Category.where(ancestry: "346/448")
    @list36s = Category.where(ancestry: "346/448")
    @list37s = Category.where(ancestry: "346/458")
    @list38s = Category.where(ancestry: "346/464")
    
  end


end

