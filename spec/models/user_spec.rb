require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:collaborators) }

    it { should have_many(:projects) }

    end

    describe "InDirect Associations" do

    it { should have_many(:collab_projects) }

    end

    describe "Validations" do
      
    end
end
