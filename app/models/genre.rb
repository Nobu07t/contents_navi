class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '漫画' },
    { id: 3, name: 'アニメ' },
    { id: 4, name: '人物' },
    { id: 5, name: '映画' },
    { id: 6, name: 'ドラマ' },
    { id: 7, name: '音楽' },
    { id: 8, name: '文学' },
    { id: 9, name: 'ゲーム' },
    { id: 10, name: '歴史' }
  ]
 
   include ActiveHash::Associations
   has_many :spots
 
  end
