class TodolistsController < ApplicationController
  def new
    @list = List.new
  end
  
  def create
    # データを新規登録するためのインスタンス
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッド実行
    list.save
    # top画面へリダイレクト=>（ redirect_to '/top' を削除）詳細画面へリダイレクトに変更
    redirect_to todolist_path(list.id)
  end
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
