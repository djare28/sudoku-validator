def is_row_valid(row_number)
    is_valid = true
    row_values = Array.new
    row_values_without_zero = Array.new
        for j in 1..9 do
        row_values << @sudoku_matrix[row_number][j-1]
        row_values_without_zero << @sudoku_matrix[row_number][j-1]
        end

        if row_values.include?('0')
        row_values_without_zero.delete('0')
        end

    #puts 'values' + row_values.to_s
    #puts row_values_without_zero

    if row_values_without_zero.uniq.length != row_values_without_zero.length
        is_valid = false
    end

    is_valid
    end

