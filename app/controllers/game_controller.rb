class GameController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
  end

  def play
    render json: get_result(params[:spaces])
  end

  private
  def get_result(data)
    require './lib/tictactoe/game'
    ttt = TicTacToe::Game.new(data)
    
    result = {position: 0, finnish: false, winner: ""}
    
    if ttt.is_win?("cross")
      result[:finnish] = true
      result[:winner] = "user"
    elsif ttt.has_blank?
      result[:position] = ttt.find_position
      if ttt.is_win?("circle")
        result[:finnish] = true
        result[:winner] = "computer"
      elsif !ttt.has_blank?
        result[:finnish] = true
        result[:winner] = "draw"
      end
    else
      result[:finnish] = true
      result[:winner] = "draw"
    end
    result
  end
end