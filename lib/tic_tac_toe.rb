class TicTacToe
  def initialize
    @board = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      ]
    end
    
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def player_move(index, player)
  @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      player = current_player
      move(index, player)
    else
      turn
  end
end

  def turn_count
    counter = 0
    @board.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
  end
end
counter
end

  def current_player
    if turn_count.even? ? "X" : "O"
  end

  def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[1])
      return combo
    end
  end
  
  def full?
    @board.all? do |location|
      location == "X" || location == "O"
    end
  end


  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end
 
  def winner
    if winnerChickenDinner = won?
      @board[winnerChickenDinner.first]
    end
  end

  def play
    while !over?
      turn
    end
  end
  
  if won?
    puts "Congratulations #{winner(board)}!"
  elsif draw?
    puts "Cat's Game!"
  end
end