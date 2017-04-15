RSpec.describe TimeEntryRepository do
  let(:repo) { TimeEntryRepository.new }
  let(:user_repo) { UserRepository.new }

  let!(:user) { user_repo.create(github_id: '345', login: 'annab', email: 'bu@example.com') }

  after { repo.clear }
  after { user_repo.clear }

  describe '#for_user' do
    context 'without entries' do
      it 'returns empty array' do
        expect(repo.for_user('')).to eq([])
      end
    end
  end

end
