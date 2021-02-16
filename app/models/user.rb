class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :group_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :name
    validates :group_id
    validates :status_id
  end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :group
  belongs_to :status
end
