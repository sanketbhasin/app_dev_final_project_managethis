class User < ApplicationRecord
  # Direct associations

  has_many   :collaborators,
             :dependent => :destroy

  has_many   :projects,
             :dependent => :destroy

  # Indirect associations

  has_many   :collab_projects,
             :through => :collaborators,
             :source => :project

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
