class BoardsController < ApplicationController
  # 掲示板一覧
  def index
    @boards = Board.all
  end

  # 掲示板詳細
  def show
    @board = Board.find(params[:id])
  end

  # 新規投稿画面
  def new
    @board = Board.new
  end
  
  # 新規投稿機能
  def create
    # 受け取るのは:titleと:body
    @board = Board.new(board_params)
    # user_idは個別に追加
    @board.user_id = current_user.id
    if @board.save
      flash[:notice] = "「#{ @board.title }」を投稿しました"
      redirect_to boards_path
    else
      render :new
    end
  end
  
  # 編集画面
  def edit
    @board = Board.find(params[:id])
  end
  
  private
    # ストロングパラメーター
    def board_params
      params.require(:board).permit(:body, :title)
    end
end
