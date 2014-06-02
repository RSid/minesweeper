require 'pry'


class Mine
  attr_reader :row_count, :column_count

  def initialize(mined, uncovered, row, column)
    @mined = mined
    @uncovered = uncovered
    @column = column
    @row = row
  end

  attr_reader :column
  attr_reader :row
  attr_reader :mined
  attr_reader :uncovered

  def do_uncover
    @uncovered = true
  end

  def make_mine
    @mined = true
  end

  def get_neighbors(minefield_array)

    minefield_array.each do |mine|
       #if x/y thing make sthem neighbors
      if (@row = mine.row + 1 || @row = mine.row - 1 || @row = mine.row) && (@column = mine.column + 1 || @column = mine.column - 1 || @column = mine.column)
        #then call the uncover function
        mine.do_uncover
        #then call the check mine function?
        if mine.mined = true
          minefield_array.any_mines_detonated = true
        end
    end

  end

end


class Minefield
  attr_reader :row_count, :column_count

  def initialize(row_count, column_count, mine_count)
    @column_y_pos = (0..column_count).to_a
    @row_x_pos = (0..row_count).to_a

    @minefield = []

    @column_y_pos.each do |y|
      @row_x_pos.each do |x|
        @minefield << Mine.new(false,false,x,y)
      end
    end

    (@minefield.sample(50)).each do |mine|
      mine.make_mine
    end

  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
    false
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)

  end

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?
    false
  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?
    false
  end

   # Returns the number of mines that are surrounding this cell (maximum of 8).
  def adjacent_mines(row, col)
    0
  end

  # Returns true if the given cell contains a mine, false otherwise.
  def contains_mine?(row, col)
    false
  end

end
