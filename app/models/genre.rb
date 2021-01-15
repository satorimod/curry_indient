class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '北インド'},
    { id: 3, name: '南インド'},
    { id: 4, name: '東インド'},
    { id: 5, name: '西インド'},
    { id: 6, name: '日本'},
    { id: 7, name: 'ネパール'},
    { id: 8, name: 'タイ'},
    { id: 9, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :goumets
end
