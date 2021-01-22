class Status < ActiveHash::Base
  self.data = [
    { id: 1, number: '---' },
    { id: 2, number: '先生' },
    { id: 3, number: '保護者' }
  ]
  include ActiveHash::Associations
  has_many :users
end
