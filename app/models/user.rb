class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name,          presence: true
  validates :group_id,      presence: true
  validates :status_id,     presence: true
  validates :group_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }

  has_many :room_users
  has_many :rooms, through: :room_users
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :group
  belongs_to :status
end
