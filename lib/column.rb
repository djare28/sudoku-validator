def is_column_valid(column_number)
    is_valid = true
    column_values = Array.new
      for i in 1..9 do
        column_values << @sudoku_matrix[i-1][column_number]
      end

      if column_values.include?('0')
        column_values.delete('0')
      end

    #puts 'values' + column_values.to_s

    if column_values.uniq.length != column_values.length
      is_valid = false
    end

    is_valid
  end