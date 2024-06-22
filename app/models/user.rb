class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :books,dependent: :destroy
  has_one_attached :profile_image
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jog')
      profile_image.attach(io: File.open(file_path),filename:'default-image.jog',content_type:'image/jpeg')
    end 
    praofile_image.variant(resize_to_limit:[width,heigh]).processed
  end
end
