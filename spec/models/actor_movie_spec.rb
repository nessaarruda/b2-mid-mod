require 'rails_helper'

describe ActorMovie do
  describe 'relationships' do
    it { belong_to :movie}
    it { belong_to :actor}
  end
end
