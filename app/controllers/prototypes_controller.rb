class PrototypesController < ApplicationController
  before_action :authenticate_user!

  before_action :move_to_index, except: :edit

  def index
    @prototypes = Prototype.all.includes(:user)
  end

  # 投稿機能を作成するためnewとcreateアクションを記述

  def new
    @prototype = Prototype.new
  end

  #createを実行、prototype_paramsの中身を代入

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user) 
  end
  
  def edit
    @prototype = Prototype.find(params[:id])
  end
  
  def update
         @prototype = Prototype.find(params[:id])
       if @prototype.update(prototype_params)
        redirect_to prototype_path
      else
        render :edit
      end
  end
    
  def destroy
      @prototype = Prototype.find(params[:id])
      @prototype.destroy
      redirect_to root_path
  end

  # (発展)プライベートメソッドを記述して、以降classで定義されていない記述は呼び出せないようにする
  # エラーが出にくくなる、可視化されエラーが出た際にプライベートメソッドは見なくてよいので解決しやすくなる
  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image ).merge(user_id: current_user.id)
  end
  
  def move_to_index
   unless user_signed_in?
     redirect_to action: :index
  end
end
end