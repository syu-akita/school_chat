class Group < ActiveHash::Base
  self.data = [
    { id: 1, number: '---' },
    { id: 2, number: '1-1' },
    { id: 3, number: '1-2' },
    { id: 4, number: '1-3' },
    { id: 5, number: '2-1' },
    { id: 6, number: '2-2' },
    { id: 7, number: '2-3' },
    { id: 8, number: '3-1' },
    { id: 9, number: '3-2' },
    { id: 10, number: '3-3' },
    { id: 11, number: '4-1' },
    { id: 12, number: '4-2' },
    { id: 13, number: '4-3' },
    { id: 14, number: '5-1' },
    { id: 15, number: '5-2' },
    { id: 16, number: '5-3' },
    { id: 17, number: '6-1' },
    { id: 18, number: '6-2' },
    { id: 19, number: '6-3' }
  ]

  include ActiveHash::Associations
  has_many :users
end
