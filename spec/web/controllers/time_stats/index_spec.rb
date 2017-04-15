require_relative '../../../../apps/web/controllers/time_stats/index'

RSpec.describe Web::Controllers::TimeStats::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  xit 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
