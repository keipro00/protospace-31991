Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: "prototypes#index"

  #prototypeコントローラーへアクションするため記述
  #rerourcesメソッドは、７つのアクションを自動で作成するメソッド
  #rails routesをでルーティングのパスがあるか確認
  resources :prototypes, only:[:new, :create, :show, :edit, :update, :destroy] do

  #comments_controller.rbへのアクションを記述
  resources :comments, only: :create
  end
  resources :users, only: :show
end
