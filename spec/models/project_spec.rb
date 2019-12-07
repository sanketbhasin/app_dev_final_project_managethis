require 'rails_helper'

RSpec.describe Project, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:collaborators) }

    it { should have_many(:bugs) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_many(:users) }

    end

    describe "Validations" do
      
    end
end
