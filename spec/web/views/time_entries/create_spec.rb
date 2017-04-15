require_relative '../../../../apps/web/views/time_entries/create'

RSpec.describe Web::Views::TimeEntries::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/time_entries/create.html.haml') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
end
