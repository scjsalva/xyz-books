class ISBNHandler
    def self.call(isbn, format = 'ISBN-13', formalized = false)
      new(isbn, format, formalized).convert
    end
  
    def initialize(isbn, format, formalized)
      @isbn = isbn.gsub(/[-\s]/, '')
      @format = format
      @formalized = formalized
    end
  
    def convert
      result = case @format
      when 'ISBN-10'
        convert_to_isbn_10
      when 'ISBN-13'
        convert_to_isbn_13
      else
        raise ArgumentError, 'Invalid format specified'
      end

      @formalized ? formalize(result) : result
    end
  
    private
  
    def convert_to_isbn_10
      raise ArgumentError, 'Invalid ISBN' unless valid_isbn?(@isbn)
  
      if @isbn.length == 10
        @isbn
      elsif @isbn.length == 13 && @isbn.start_with?('978')
        isbn_10 = @isbn[3..11]
        check_digit = calculate_isbn_10_check_digit(isbn_10)
        isbn_10 + check_digit
      else
        raise ArgumentError, 'Cannot convert to ISBN-10'
      end
    end
  
    def convert_to_isbn_13
      raise ArgumentError, 'Invalid ISBN' unless valid_isbn?(@isbn)
  
      if @isbn.length == 13
        @isbn
      elsif @isbn.length == 10
        isbn_13 = '978' + @isbn[0..8]
        check_digit = calculate_isbn_13_check_digit(isbn_13)
        isbn_13 + check_digit
      else
        raise ArgumentError, 'Cannot convert to ISBN-13'
      end
    end
  
    def valid_isbn?(isbn)
      isbn.length == 10 || isbn.length == 13
    end
  
    def calculate_isbn_10_check_digit(isbn)
      sum = 0
      isbn.each_char.with_index do |digit, index|
        sum += digit.to_i * (10 - index)
      end
      check_digit = (11 - (sum % 11)) % 11
      check_digit == 10 ? 'X' : check_digit.to_s
    end
  
    def calculate_isbn_13_check_digit(isbn)
      sum = 0
      isbn.each_char.with_index do |digit, index|
        sum += digit.to_i * (index.even? ? 1 : 3)
      end
      ((10 - (sum % 10)) % 10).to_s
    end
  
    def formalize(isbn)
      case isbn.length
      when 10
        "#{isbn[0]}-#{isbn[1..3]}-#{isbn[4..8]}-#{isbn[9]}"
      when 13
        "#{isbn[0..2]}-#{isbn[3]}-#{isbn[4..5]}-#{isbn[6..11]}-#{isbn[12]}"
      else
        raise ArgumentError, 'Invalid ISBN length for formalization'
      end
    end
  end