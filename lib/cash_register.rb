require 'pry'

class CashRegister

    attr_accessor :discount, :total, :items, :price, :quantity

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(item, price, quantity=1)
        self.total += price * quantity
        self.items.fill(item, self.items.size, quantity)
        self.price, self.quantity = price, quantity
    end

    def apply_discount
        self.total -= (self.total * (self.discount.to_f / 100)).to_i
        no_discount = "There is no discount to apply."
        discount_success = "After the discount, the total comes to $#{self.total}."
        self.discount > 0 ? discount_success : no_discount
    end

    def void_last_transaction
        self.total -= self.price * self.quantity
    end

end