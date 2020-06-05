require 'pry'
class CashRegister

    attr_accessor :total, :discount, :price, :items, :quantity

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end
    
    def add_item (item, price, quantity = 1)
        @price = price
        @total += price * quantity
        @quantity = quantity
        if quantity > 1
            index = 0
            while index < quantity
                @items << item
                index += 1
            end
        else
            @items << item
        end
    end
    def apply_discount
       if @discount > 0
        @discounted_total = (price * discount) / 100
        @total -= @discounted_total
        return "After the discount, the total comes to $#{total}."
       else
        return "There is no discount to apply."
       end
    end

    def void_last_transaction
         @total -= @price * @quantity
    end
end
