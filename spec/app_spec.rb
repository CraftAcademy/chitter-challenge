describe 'Root Path' do
  describe 'GET /' do
    before { get '/' }
    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end
end

describe 'Join Path' do
  describe 'GET join' do
    before { get 'join' }
    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end
end

describe 'Peep Path' do
  describe 'GET peeps' do
    before { get 'peeps' }
    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end
end



