def is_subgroup_valid(row_number, column_number)
    is_valid = true
    subgroup_values = Array.new
    for i in row_number-1..row_number+1 do
      for j in column_number-1..column_number+1 do
        subgroup_values << @sudoku_matrix[i][j]
      end
    end

    if subgroup_values.include?('0')
      subgroup_values.delete('0')
    end

    if subgroup_values.uniq.length != subgroup_values.length
      is_valid = false
    end

    is_valid
  end