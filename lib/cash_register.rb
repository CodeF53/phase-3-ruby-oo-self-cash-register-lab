class CashRegister
    attr_accessor :discount

    def total
        sum = 0
        @cart.each {|item| sum+=item[:price]*item[:quantity]}
        return sum
    end

    def items
        @cart.map { |item| [item[:title]] * item[:quantity] }.flatten
    end

    def initialize employee_discount = 0
        @discount = employee_discount
        @cart = []
    end

    def add_item title, price, quantity = 1
        @cart += [{title: title, price: price, quantity: quantity}]
    end

    def apply_discount
        if @discount>0
            add_item("discount", @discount * -10)
            @discount = 0
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        if (@cart.length > 0)
            @cart.pop
        else
            "you gotta have some items to remove dumbo"
        end
    end
end

test = CashRegister.new()
test.add_item("cum", 7, 2)
test.add_item("bum", 12, 3)
pp test.items
pp test.total
test.void_last_transaction
pp test.items
pp test.total