class TicTacToe::Game
  
  def initialize(board)
    @win = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    @corners = [1,3,7,9]
    @center = 5
    @middles = [2, 4, 6, 8]
    @board = board
  end
  
  def find_position
    cell = player_can_win?("circle") # if user can win
    cell = player_can_win?("cross") if cell == false # if computer can win
    cell = any_corner_empty? if cell == false # find corners
    cell = center_is_empty? if cell == false # find de center cell
    cell = any_middle_empty? if cell == false # other cell empty
    @board[cell] = "circle"
    cell
  end
  
  def is_win?(mark)
    win = false
    @win.each do |line|
      if @board[line[0]] == mark && @board[line[1]] == mark && @board[line[2]] == mark
        win = true
      elsif @board[line[0]] == mark && @board[line[1]] == mark && @board[line[2]] == mark
        win = true
      elsif @board[line[0]] == mark && @board[line[1]] == mark && @board[line[2]] == mark
        win = true
      end
    end
    win
  end
  
  def has_blank?
    r = false
    @board.each do |cell|
      r = true if cell == "blank"
    end
    r
  end
  
  private
  def any_middle_empty?
    empty = false
    @middles.each do |cell|
      empty = cell if @board[cell] == "blank"
    end
    empty
  end
  
  def center_is_empty?
    empty = false
    if @board[@center] == "blank"
      empty = @center
    end
  end
  
  def any_corner_empty?
    empty = false
    @corners.each do |cell|
      empty = cell if @board[cell] == "blank"
    end
    empty
  end
  
  def player_can_win?(mark)
    empty = false
    @win.each do |line|
      #puts line[0].to_s + " - " + line[1].to_s + " - " + line[2].to_s
      if @board[line[0]] == mark && @board[line[1]] == mark && @board[line[2]] == "blank"
        empty = line[2]
      elsif @board[line[0]] == mark && @board[line[1]] == "blank" && @board[line[2]] == mark
        empty = line[1]
      elsif @board[line[0]] == "blank" && @board[line[1]] == mark && @board[line[2]] == mark
        empty = line[0]
      end
    end
    empty
  end
end