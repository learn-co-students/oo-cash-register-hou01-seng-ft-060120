
class CashRegister 

    attr_accessor :total, :discount, :items_added, :price, :quantity

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items_added = []
    end

    def add_item(title, price, quantity = 1)
        @price = price
        @quantity = quantity
        if (quantity > 1)
            new_total = @total += price * quantity
            @items_added.fill(title, @items_added.size, quantity)
        else 
            new_total = @total += price
            @items_added.fill(title, @items_added.size, quantity)
        end
        @new_total = new_total
        
    end

    def apply_discount
        self.total -= (self.total * (self.discount.to_f / 100)).to_i
        no_discount = "There is no discount to apply."
        discount_success = "After the discount, the total comes to $#{self.total}."
        self.discount > 0 ? discount_success : no_discount
        
    end

    def items
        self.items_added 
    end

    def void_last_transaction
        @total -= @price * @quantity
        
    end

end
