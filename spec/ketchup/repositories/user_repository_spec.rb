RSpec.describe UserRepository do
  let(:repo) { UserRepository.new }

  after { repo.clear }

  describe '#one_by_github_id' do
    let!(:user) { repo.create(github_id: '123', login: 'anna', email: 'buyan@example.com') }

    it 'does not find for nil gitbub id' do
      expect(repo.one_by_github_id(nil)).to eq(nil)
    end

    it 'does not find for other github id' do
      expect(repo.one_by_github_id('1234')).to eq(nil)
    end

    it 'finds for github id' do
      expect(repo.one_by_github_id('123')).to eq(user)
    end
  end

  describe '#for_github' do
    let(:github_data) { { email: 'mary@example.com', id: '234', login: 'mary' } }
    it "creates the user when she doesn't exist" do
      expect { repo.for_github(github_data) }.to change(repo.users, :count).by(1)
    end

    it "doesn't create when the user exists" do
      repo.create(github_id: github_data.fetch(:id), login: github_data.fetch(:login), email: github_data.fetch(:email))
      expect { repo.for_github(github_data) }.to change(repo.users, :count).by(0)
    end
  end
end
