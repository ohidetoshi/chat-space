Rails.application.routes.draw do
  root          'messages#index'          #ルートパスの指定

  get     'messages'          =>  'messages#index'      #top画面
end
