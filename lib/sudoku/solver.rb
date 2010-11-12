module Sudoku
  module Solver
    class InvalidRowError < ArgumentError; end
    class InvalidColumnError < ArgumentError; end
    class InvalidSquareError < ArgumentError; end

    class Board
      def initialize(board)
        if board.match(/.*\.txt$/)
          @board = File.open(board).read.split("\n").join('')
        elsif board.is_a?(Array)
          @board = board.flatten.join
        else
          @board = board
        end
      end

      def solve
        while !solved?
          pass
        end
        disp
      end

      def pass
        (1..81).each do |cell|
          if @board[cell-1, 1].to_i == 0
            col = [9,1,2,3,4,5,6,7,8][cell%9]
            row = (cell-1)/9 + 1
            possibilities = check_cell(row, col)
            if possibilities.size == 1
              @board[(cell-1)] = possibilities.first.to_s
            end
          end
        end
      end

      private

      def disp
        (1..9).map { |row| @board[(9*(row-1)), 9]}.join("\n")
      end

      def check_cell(row, col)
        square = [1,4,7][(row-1)/3] + (col-1)/3
        check_row(row).select { |i| check_column(col).include?(i) }.select { |i| check_square(square).include?(i) }
      end

      def check_row(row_num)
        raise InvalidRowError, "Row must be between 1 and 9" if row_num < 1 || row_num > 9
        values = (1..9).to_a
        @board[(row_num-1)*9, 9].each_char do |char|
          values.delete_if { |i| i == char.to_i }
        end
        values
      end

      def check_column(col_num)
        raise InvalidColumnError, "Column must be between 1 and 9" if col_num < 1 || col_num > 9
        values = (1..9).to_a
        column = []
        (1..9).each do |i|
          column << @board[col_num - 1 + (9 * (i-1)), 1]
        end
        column.each do |char|
          values.delete_if { |i| i == char.to_i }
        end
        values
      end

      def check_square(square_num)
        raise InvalidSquareError, "Square must be between 1 and 9" if square_num < 1 || square_num > 9
        values = (1..9).to_a
        square = []
        row = ((square_num-1)/3) + 1
        col = [3, 1, 2][square_num%3]
        rows = (((3*row)-2)..(3*row)).to_a
        cols = (((3*col)-2)..(3*col)).to_a
        rows.each do |i|
          cols.each do |j|
            square << @board[j - 1 + (9 * (i-1)), 1]
          end
        end
        square.each do |char|
          values.delete_if { |i| i == char.to_i }
        end
        values
      end

      def solved?
        @board.match(/^[1-9]+$/)
      end
    end
  end
end
