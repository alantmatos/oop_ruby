

=begin

Encapsulation part 3

But....
 What if we really need to change something, such as apply a discount on books that
 meets certain criteria? 

Creating a method apply_discount and set a discount if the book was
released before 2000 wont work, because the data is encapsuled, just like we
saw before external methods can't modify.

Encapsulation says that, if needed to change a behavior of the class, the method
should be private inside the class.

Creating the private method set_discount inside the class, and applying the 
discount rule, will garantee that the price will only be set inside this method
and nowhere else in the application, making it easy to find and change if neccessary.

    
=end


class Book
    attr_reader :title, :price, :release_year, :quantity
    def initialize(title, price, release_year, quantity)
        @title = title
        @price = price
        @release_year = release_year
        @quantity = quantity
        @price = set_discount(price)
    end

    private

    def set_discount(base)
        if @release_year < 2000
            base * 0.7
        else
            base
        end
    end

end


rails_book = Book.new("Rails - Best Practices", 40, 2020, 226)
ruby_book = Book.new("Ruby - mkdir dev happy", 45, 2000, 453)
ruby_on_rails_book = Book.new("Ruby On Rails - the web runs in trails", 50, 2010, 14)
ruby_kid_book = Book.new("Ruby - The newest kid in the block", 25, 1995, 8)
tdd_book = Book.new("TDD - Ruby", 30, 1996, 7)

books = [ rails_book, ruby_book, ruby_on_rails_book, ruby_kid_book, tdd_book ]


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


# WICH METHOD DO YOU WANT TO CALL??
def calls_methods (books)
    books.each do |book|
        # print_invoice(book)        
        # newsletter_books_on_sale(book)
        apply_discount(book)
    end
end



calls_methods(books)
