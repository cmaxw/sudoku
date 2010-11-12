require File.dirname(__FILE__) + "/../lib/sudoku"
require 'rspec'

describe Sudoku::Solver::Board do
  before(:each) do
    @board = Sudoku::Solver::Board.new(File.dirname(__FILE__) + "/test_board.txt")
  end

  # I wrote these specs to help me build the solution. However, I have made the supporting methods private, so I'm removing the tests so they don't get run.
  
  # it "gets the missing numbers from a row" do
  #   @board.check_row(4).should == [2,3,4,5,7]
  # end

  # it "throws an error when the row number is invalid" do
  #   lambda { @board.check_row(0) }.should raise_error(Sudoku::Solver::InvalidRowError, "Row must be between 1 and 9")
  # end

  # it "gets the missing numbers from a column" do
  #   @board.check_column(1).should == [2,3,4,5,6,7]
  # end

  # it "throws an error when the column number is invalid" do
  #   lambda { @board.check_column(10) }.should raise_error(Sudoku::Solver::InvalidColumnError, "Column must be between 1 and 9")
  # end

  # it "gets the missing numbers from a square" do
  #   @board.check_square(1).should == [2,7,9]
  #   @board.check_square(4).should == [3,5,6,7,8]
  # end

  # it "throws an error when the square number is invalid" do
  #   lambda { @board.check_square(10) }.should raise_error(Sudoku::Solver::InvalidSquareError, "Square must be between 1 and 9")
  # end

  # it "checks for possible values on a cell" do
  #   @board.check_cell(4, 3).should == [5,7]
  #   @board.check_cell(6, 7).should == [1,9]
  # end

  # it "correctly makes a pass on the board" do
  #   @board.pass
  #   @board.disp
  # end

  it "solves the puzzle" do
    @board.solve.should == "829175463
763248159
154693278
375916842
941782635
682534917
498367521
236851794
517429386"
  end
end
