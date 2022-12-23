require_relative '../lib/row'
require_relative '../lib/column'
require_relative '../lib/subgroup'

class Validator

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
    @sudoku_matrix = Array.new(9){Array.new(9)}
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    # Your code here
    message = nil
    create_matrix  

    #check characters
    if is_valid_length && all_numbers
      #check rows
      for row in 0..8 do
        if !is_row_valid(row)
          return message = 'Sudoku is invalid.'
        end
      end

      #check columns
      for column in 0..8 do
        if !is_column_valid(column)
          return message = 'Sudoku is invalid.'
        end
      end

      #check subgroups
      1.step(8,3).each do |row|
        1.step(8,3).each do |col|
          if !is_subgroup_valid(row,col) 
            return message = 'Sudoku is invalid.'        
          end
        end
      end

      #sudoku is valid, checking zeroes
      if cointains_zeros
        message = 'Sudoku is valid but incomplete.'
      else
        message = 'Sudoku is valid.'
      end

    else
      message = 'Sudoku is invalid.'
    end

      message
  end



  def create_matrix
    upline = @puzzle_string.gsub(/[|]/, "")
    minus = upline.gsub(/[-]/, "")
    plus = minus.gsub(/[+]/, "")
    new_line = plus.gsub(/\n/, " ")
    double_space = new_line.gsub("  ", " ")
    values = double_space.split(/ /, -1)


    for i in 1..9 do
      for j in 1..9 do
        @sudoku_matrix[i-1][j-1] = values[i*9+j - 10]
      end
    end

    #puts @sudoku_matrix
  end


  def is_valid_length
    is_valid = true
    @sudoku_matrix.each do |outher_array_elements|
      outher_array_elements.each do |inner_array_element|
        if inner_array_element.length > 1
          break is_valid = false
        end
      end
    end
    is_valid
  end

  
  def all_numbers
    is_number = true
    @sudoku_matrix.each do |outher_array_elements|
      outher_array_elements.each do |inner_array_element|
        if inner_array_element.match(/\D/)
          break is_number = false
        end
      end
    end
    is_number
  end


  def cointains_zeros
    zero = false
    @sudoku_matrix.each do |outher_array_elements|
      outher_array_elements.each do |inner_array_element|
        if inner_array_element.match('0')
          break zero = true
        end
      end
    end
    zero
  end

end
