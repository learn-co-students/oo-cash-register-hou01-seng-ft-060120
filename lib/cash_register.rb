class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      items.push(title)
    end
    @last_transaction_amount = @total
    @total += price * quantity
  end

  def apply_discount()
    if @discount > 0
      @total -= @total * @discount / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction()
    @total = @last_transaction_amount
  end
end
