require 'rails-helper'

describe Studio do
  describe 'relationships' do
    it { should have_many :movies}
  end
end
