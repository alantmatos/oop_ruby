=begin

Abstration _ part 3

Now, lets make some changes in our code, so that it will not 
allow changes to be made outside the allowed scope.
    
=end




=begin 

By changing from attr_accesor ( permits reading and writting ) 
to attr_reader ( allows reading only) we can stop data from being updated 
everywhere in the code. 
We also need to add a constructor, that expects the data for creating a book, 
and currently there i no way to update book info, since we havent created
a method to do so.

=end

class Book
    attr_reader :title, :price, :release_year
    def initialize(title, price, release_year)
        @title = title
        @price = price
        @release_year = release_year        
    end
end


rails_book = Book.new("Ruby - Best Practices", 40, 2020)
ruby_book = Book.new("Ruby - mk dev happy", 45, 2005)




def print_invoice(books)
    books.each do |book|
        puts "Title: #{book.title} - Price:  #{book.price}"
        puts " ------------------------------------ "
    end
end

books = [ rails_book, ruby_book ]


print_invoice(books)




=begin 

This code has abstracted the data necessary to create a book, if we try to modify data anywhere in our code
we wont be allowed to do so.

=end