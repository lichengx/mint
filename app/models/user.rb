class User < ActiveRecord::Base
  has_attached_file :avatar,
                    styles: { medium: '300x300>',small: '200x200>', thumb: '100x100>', :processors => [:papercrop]},
                    default_url: '/images/missing.gif'
                    # path:  ':rails_root/uploads/:class/:attachment/:id/:style/:filename',
                    # url: '/uploads/:class/:attachment/:id/:style/:filename'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  crop_attached_file :avatar
  has_merit
  after_initialize :set_default_role, :if => :new_record?
  belongs_to :role
  has_many :galleries

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role.name == 'admin'
  end
  private

  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end

end
