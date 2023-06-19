

=begin

Encapsulation part 6


say we want to sell books, that means instances has to be deleted
from stock as we sell.

    
=end


module Counter
    def <<(book)
        push(book)
        if @max_inventory_reached.nil? || @max_inventory_reached < size
          @max_inventory_reached = size
        end
        self
      end

    def max_inventory_reached
        @max_inventory_reached
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
    attr_reader :books
    def initialize
        @books = []
        @books.extend Counter
    end

    # also known as methond "Tell Don't Ask", this method now
    # tell the book to read its own properties, which the class Stock
    # doesnt have access to anymore.
    def export_csv
        @books.each do |book|
            puts book.to_csv(book)
        end
    end


    def print_invoice
        @books.each do |book|
            puts book.title
        end
    end


    def <<(book)
        @books << book if book
        self
    end

    def remove(book)  
           @books.delete(book)
    end

    def max_inventory_reached
        @books.max_inventory_reached
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





end





# stock = Stock.new
# stock.add_book_to_stock(Book.new("Rails - Best Practices", 40, 2020, 226, true))
# stock.add_book_to_stock(Book.new("Ruby - mkdir dev happy", 45, 2000, 453, false))
# stock.add_book_to_stock(Book.new("Ruby On Rails - the web runs in trails", 50, 2010, 14, false))
# stock.add_book_to_stock(Book.new("Ruby - The newest kid in the block", 25, 1995, 8, false))
# stock.add_book_to_stock(Book.new("TDD - Ruby", 30, 1996, 7, true))
# stock.add_book_to_stock( Book.new("Agile & Ruby - Ruby", 15, 2001, 16, false))
# stock.add_book_to_stock( Book.new("How BigTech is using Ruby?", 65, 2002, 47, true))



ds = Book.new("Data Structures", 100, 1998, 50, true)
sd = Book.new("Software Design", 70, 2011, 96, true)
programmer = Book.new("The Pragmatic Programmer", 100, 1999,15, true)
ruby = Book.new("Programming Ruby", 100, 2004, 36, true)
good_ol_ruby = Book.new("Good Ol Ruby", 50, 2003, 42, false)
brand_new_ruby = Book.new("Brand New Ruby", 50, 1995, 3, false)

stock = Stock.new
stock <<  ds
stock <<  sd
stock <<  programmer << ruby
stock << good_ol_ruby
stock << brand_new_ruby


stock.print_invoice
stock.books.delete ds
puts stock.max_inventory_reached
stock.print_invoice
puts stock.max_inventory_reached