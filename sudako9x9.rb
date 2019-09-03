N = 9
UNASSIGNED = 0
$count = 0

#Search for a num in a specific row with grid,number and row number as arguments
def exist_in_row(grid, row, number)
  column = 0
  while column < N
    return true if grid[row][column] == number
    column += 1
  end
  return false
end

#Search for a num in a specific column with grid,number and column number as arguments
def exist_in_column(grid, column, number)
  row = 0
  while row < N
    return true if grid[row][column] == number
    row += 1
  end
  return false
end

#Search for num in box with grid,startRow,startCol and num as arguments
def exists_in_box(grid, start_row, start_column, number)
  row = 0
  column = 0
  while row < 3
    column = 0
    while column < 3
      return true if grid[row + start_row][column + start_column] == number
      column += 1
    end
    row += 1
  end
  return false
end

#Check if num can be placed at grid cell (row,col)
def is_safe(grid, row, column, number)
  $count += 1
  return !exist_in_row(grid, row, number) && !exist_in_column(grid, column, number) && !exists_in_box(grid, row - (row % 3), column - (column % 3), number)
end

#finding unassigned cells
def unassigned_cells(grid, row, column)
      return true if grid[row][column] == 0
  return false
end

#Find possible numbers for each unassigned cells
def find_unassigned_array(grid)
  unassigned_array = Array.new
  row = 0
  while row < N
    column = 0
    while column < N
      if unassigned_cells(grid, row, column)
        unassigned_array << [row, column]
      end
      column += 1
    end
    row += 1
  end
  return unassigned_array
end

#Solve the Sudoku
def solve(grid)
  unassigned_array = find_unassigned_array(grid)
  i = 0
  while i < unassigned_array.length
    row = unassigned_array[i][0]
    column = unassigned_array[i][1]
    number = grid[row][column] + 1
    found = false

    while !found && number <= 9
      if is_safe(grid, row, column, number)
        found = true
        grid[row][column] = number
        i += 1
      else
        number += 1
      end
    end

    if !found
      grid[row][column] = 0
      i -= 1
    end
  end
  return true
end

#Print 2D Array
def print_array(array)
  array.each_with_index do |valueA, indexA|
    puts "\n-------------------------------------"
    print "| "
    valueA.each_with_index do |valueB, indexB|
      print "#{valueB} | "
    end
  end
  puts "\n-------------------------------------\n\n"
end

grid = [[0,0,0, 0,0,0, 0,0,0],
        [0,0,3, 6,0,0, 0,0,0],
        [0,7,0, 0,9,0, 2,0,0],
        [0,5,0, 0,0,7, 0,0,0],
        [0,0,0, 0,4,5, 7,0,0],
        [0,0,0, 1,0,0, 0,3,0],
        [0,0,1, 0,0,0, 0,6,8],
        [0,0,8, 5,0,0, 0,1,0],
        [0,9,0, 0,0,0, 4,0,0]]

if solve(grid)
  print_array(grid)
  puts $count
else
  puts "No Solution"
end
