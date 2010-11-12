require File.dirname(__FILE__) + "/../lib/sudoku"
require 'rspec'

describe Sudoku::Solver::Board do
  before(:each) do
    @board = Sudoku::Solver::Board.new(File.dirname(__FILE__) + "/test_board.txt")
  end

  it "gets the missing numbers from a row" do
    @board.check_row(1).should == [1,2,5,7,8]
  end

  it "throws an error when the row number is invalid" do
    lambda { @board.check_row(0) }.should raise_error(Sudoku::Solver::InvalidRowError, "Row must be between 1 and 9")
  end

  it "gets the missing numbers from a column" do
    @board.check_column(1).should == [1,2,3,4,6,7]
  end

  it "throws an error when the row number is invalid" do
    lambda { @board.check_column(10) }.should raise_error(Sudoku::Solver::InvalidColumnError, "Column must be between 1 and 9")
  end

end
