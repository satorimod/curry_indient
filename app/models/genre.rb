class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '北インド'},
    { id: 2, name: '南インド'},
    { id: 3, name: '東インド'},
    { id: 4, name: '西インド'},
    { id: 5, name: '日本'},
    { id: 6, name: 'ネパール'},
    { id: 7, name: 'タイ'},
    { id: 8, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :goumets
end
