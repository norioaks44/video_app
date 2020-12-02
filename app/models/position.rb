class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '--'},
    { id: 2, name: 'FW'},
    { id: 3, name: 'BK'},
    { id: 4, name: 'FW,BK両方'}
  ]

  include ActiveHash::Associations
  has_many :videos
end

