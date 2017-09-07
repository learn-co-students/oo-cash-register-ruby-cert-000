class CashRegister

attr_accessor :total, :discount, :cart, :last_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(title, price, quantity = 1)
    item = {}
    item[:title] = title
    item[:price] = price
    item[:quantity] = quantity

    @total += price*quantity

    @cart << item

    @last_item = @cart.last
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= @total*@discount / 100
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    item_list = []
    @cart.each do |item|
      for x in 1..item[:quantity]
        item_list << item[:title]
      end
    end
    return item_list
  end

  def void_last_transaction
    @total -= @last_item[:price]
  end

end
