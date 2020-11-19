
class CashRegister
    attr_accessor :discount, :total
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @all_items = []
        @item_price = []
        @item_quantity = []
    end

    def add_item(title,price,quantity=1)
        if quantity > 1
            @total += price*quantity
            quantity.times do
                @all_items << title
                @item_price << price
            end
                @item_quantity << quantity
        else
            @total += price
            @all_items << title
            @item_price << price
            @item_quantity << quantity
        end
    end

    def apply_discount
        if @discount > 0
            @discount = @discount.to_f
            @discount = @discount/100
            @total -= @total*@discount
            p "After the discount, the total comes to $#{@total.round()}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @all_items
    end

    def void_last_transaction
        times = @all_items.count(@all_items.last)
        if times == 0
            return 
        else
            times.times do
                @total -= @item_price.last
                @all_items.pop
                @item_price.pop
            end
        end
    end
end