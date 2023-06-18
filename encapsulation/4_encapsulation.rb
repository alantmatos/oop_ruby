

=begin

Encapsulation part 4

Time has passed and the bookstore has a new rule for the prices as well as a 
new discount. 

Since changing prices is only available inside the book's class, that is the
only method that needs to be changed.

Also, since we are working with a stock of books, maybe we should have a class
for that too, which will be implemented down below, as well as some methods
for this class.
end
    
=end


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

    def export_csv
        @books.each do |book|
            puts "#{book.title}, #{book.price}"
            puts " ------------------------------------ " 
        end
    end

    def inventory
        puts "The Bookstore has #{@books.length} books in the inventory"
    end

    def add_book_to_stock(book)
        @books << book if book
    end

end



def newsletter_books_on_sale(book)
    if book.quantity < 10       
        puts "You better grab one of these before they are gone: "
        puts "Title: #{book.title} - Price:  #{book.price}, Only: #{book.quantity} in stock!!!"
        puts " ------------------------------------ "
    end
end


def apply_discount(book)
    if book.release_year < 2000
        puts " -------- DEALS ----------- "
        puts "Title: #{book.title} - Price:  #{book.price}"
    end

end


def print_invoice(book)
    puts "Title: #{book.title} - Price:  #{book.price}"
    puts " ------------------------------------ "
end


def cheaper_than(book, value)
    if(book.price) < value
        puts "#{book.title}, #{book.price}"
        puts " ------------------------------------ "
    end
end


stock = Stock.new
stock.add_book_to_stock(Book.new("Rails - Best Practices", 40, 2020, 226, true))
stock.add_book_to_stock(Book.new("Ruby - mkdir dev happy", 45, 2000, 453, false))
stock.add_book_to_stock(Book.new("Ruby On Rails - the web runs in trails", 50, 2010, 14, false))
stock.add_book_to_stock(Book.new("Ruby - The newest kid in the block", 25, 1995, 8, false))
stock.add_book_to_stock(Book.new("TDD - Ruby", 30, 1996, 7, true))
stock.add_book_to_stock( Book.new("Agile & Ruby - Ruby", 15, 2001, 16, false))


# stock.books is the same as the previous implementation =>
# books = [ rails_book, ruby_book, ruby_on_rails_book, ruby_kid_book, tdd_book ]




# WICH METHOD DO YOU WANT TO CALL??
def calls_methods (books)
    books.each do |book|
        # print_invoice(book)        
        # newsletter_books_on_sale(book)
        # apply_discount(book)
        cheaper_than(book, 100)
    end
end

#calls_methods(stock.books)

stock.export_csv
stock.inventory