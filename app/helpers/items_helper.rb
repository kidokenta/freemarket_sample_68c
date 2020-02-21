module ItemsHelper



  def condition
    if @item.condition == 0
      condition = "新品・未使用"
    elsif @item.condition == 1
      condition = "未使用に近い"
    elsif @item.condition == 2
      condition = "目立った傷や汚れなし"
    elsif @item.condition == 3
      condition = "やや傷や汚れあり"
    elsif @item.condition == 4
      condition = "傷や汚れあり"
    elsif @item.condition == 5
      condition = "全体的に状態が悪い"
    end
  end

  def shipping_fee
    if @item.shipping_fee == 0
      shipping_fee = "送料込み"
    elsif @item.shipping_fee == 1
      shipping_fee = "送料別"
    end
  end

  def shipping_company
    if @item.shipping_company == 0
      shipping_company = "未定"
    elsif @item.shipping_company == 1
      shipping_company = "クロネコヤマト"
    elsif @item.shipping_company == 2
      shipping_company = "ゆうパック"
    elsif @item.shipping_company == 3
      shipping_company = "ゆうメール"
    end
  end

  def size
  end

  def shipping_days
    if @item.shipping_days == 0
      shipping_days = "１〜２日"
    elsif @item.shipping_days == 1
      shipping_days = "２〜３日"
    elsif @item.shipping_days == 2
      shipping_days = "４〜７日"
    end
  end

  def transaction_message_for_buyer
    if @item.status == 3
      transaction_message_for_buyer = "商品を購入しました発送までお待ちください"
    elsif @item.status == 4
      transaction_message_for_buyer = "商品が発送されました"
    elsif @item.status == 5
      transaction_message_for_buyer = "取引完了"
    end
  end

  def transaction_message_for_seller
    if @item.status == 3
      transaction_message_for_seller = "商品が購入されました。発送をお願いします"
    elsif @item.status == 4
      transaction_message_for_seller = "商品を発送しました"
    elsif @item.status == 5
      transaction_message_for_seller = "取引完了"
    end
  end


end
