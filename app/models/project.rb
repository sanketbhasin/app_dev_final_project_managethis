class Project < ApplicationRecord
  # Direct associations

  has_many   :collaborators,
             :dependent => :destroy

  has_many   :bugs,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :users,
             :through => :collaborators,
             :source => :user

  # Validations

end
