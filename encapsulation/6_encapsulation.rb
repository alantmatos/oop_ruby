

=begin

Encapsulation part 6


say we want to sell books, that means instances has to be deleted
from stock as we sell.

    
=end


module Counter
    def add_book_to_stock(book)
        push(book)
        if( @max_inventory.nil? || @max_inventory < inventory )
            @max_inventory = inventory
        end
        self
    end

    def max_reached_inventory
        @max_inventory
    end

end


class Book
    attr_reader :title, :price, :release_year, :quantity, :republished
    def initialize(title, price, release_year, quantity, republished)
        @title = title
        @price = price
        @release_year = release_year
        @quantity = quantity
        @republished = republished
        @price = set_discount(price)
    end

    def to_csv(book)
        puts "#{book.title}, $#{book.price}"
    end

    def newsletter_sales_format(book)
        puts "Title: #{book.title} - Price:  #{book.price}, Only: #{book.quantity} in stock!!!"
    end


    private

    def set_discount(base)
        if @release_year < 2006
            if @republished
                base * 0.9
            else
                base * 0.95
            end
        elsif @release_year <= 2010
            base * 0.96
        else
            base
        end
    end 
end


class Stock
    def initialize
        @books = []
    end

    # also known as methond "Tell Don't Ask", this method now
    # tell the book to read its own properties, which the class Stock
    # doesnt have access to anymore.
    def export_csv
        @books.each do |book|
            puts book.to_csv(book)
        end
    end

    def inventory
        @books.length
    end

    def add_book_to_stock(book)
        @books << book if book
    end

    def remove_book_from_stock
        
    end

    def newsletter_books_on_sale
        puts " "
        puts "------- Few left, You might want to grab one of these begore they are gone. ------- "
        puts " "
        @books.each do |book|
            if book.quantity < 10
                book.newsletter_sales_format(book)
            end
        end
    end

    
    def apply_discount
        puts " ---------------DEALS---------------"
        puts "  "
        @books.each do |book|
            if book.release_year < 2000            
                book.to_csv(book)                
            end
        end
    end



end



stock = Stock.new
stock.add_book_to_stock(Book.new("Rails - Best Practices", 40, 2020, 226, true))
stock.add_book_to_stock(Book.new("Ruby - mkdir dev happy", 45, 2000, 453, false))
stock.add_book_to_stock(Book.new("Ruby On Rails - the web runs in trails", 50, 2010, 14, false))
stock.add_book_to_stock(Book.new("Ruby - The newest kid in the block", 25, 1995, 8, false))
stock.add_book_to_stock(Book.new("TDD - Ruby", 30, 1996, 7, true))
stock.add_book_to_stock( Book.new("Agile & Ruby - Ruby", 15, 2001, 16, false))
stock.add_book_to_stock( Book.new("How BigTech is using Ruby?", 65, 2002, 47, true))



#stock.export_csv
#stock.inventory
#stock.apply_discount
#stock.newsletter_books_on_sale
