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
          @board = board.flatten.join('')
        else
          @board = board
        end
      end

      def solve
      end

      def check_row(row_num)
        raise InvalidRowError, "Row must be between 1 and 9" if row_num <1 || row_num > 9
        values = (1..9).to_a
        @board[row_num-1, 9].each_char do |char|
          values.delete_if { |i| i == char.to_i }
        end
        values
      end

      def check_column(col_num)
        raise InvalidColumnError, "Column must be between 1 and 9" if col_num <1 || col_num > 9
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


      private
      
      def get_row

      end

      def get_column

      end

      def get_square

      end


    end
  end
end
