=begin

Encapsulation part 1

In the following sample, with no Encapsulation, out books data is 
exposed, and can easly be manituplated by different methods, such as the
method that supposed to print, can now change the price.

=end


class Book
    attr_accessor :title, :price, :release_year
end


rails_book = Book.new
rails_book.price = 40
rails_book.title = "Ruby - Best Practices"
rails_book.release_year = 2020


ruby_book = Book.new
ruby_book.price = 45
ruby_book.title = "Ruby - mk dev happy"
ruby_book.release_year = 2005


def print_invoice(books)
    books.each do |book|
        puts book.title = "The title has been updated by the print_invoice method"
        puts book.price = 11111111111111111111
    end
end

books = [ rails_book, ruby_book ]

print_invoice(books)




=begin

Encapsulation part 1

As we can see, this code allows to create books, and update its information in
methods that were not supposed to, this happens because the book's data
has not been abstract/hideen from the methods.  

=end
