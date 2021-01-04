require 'rails_helper'

describe Movie do
  describe 'relationships' do
    it { should belong_to :studio}
    it { should have_many :actor_movies}
    it { should have_many(:actors).through(:actor_movies)}
  end
end
