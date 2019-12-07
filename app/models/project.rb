class Project < ApplicationRecord
  # Direct associations

  has_many   :bugs,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
