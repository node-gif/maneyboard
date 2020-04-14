class BoardsController < ApplicationController
  # 掲示板一覧
  def index
    @boards = Board.all
  end

  # 掲示板詳細
  def show
    @board = Board.find(board_params)
  end

  # 新規投稿画面
  def new
    @board = Board.new
  end
  
  # 編集画面
  def edit
    @board = Board.find(board_params)
  end
  
  # ストロングパラメーター
  def board_params
    params.require(:board).permit(:body, :title)
  end
end
