class Collaborator < ApplicationRecord
  # Direct associations

  belongs_to :project

  belongs_to :user

  # Indirect associations

  # Validations

end
