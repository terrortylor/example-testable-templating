require 'rspec'
require_relative '../../lib/dashboards.rb'

describe RegisterDashboard do
  it 'Renders RegisterDashboard with correct host' do
    file_mock = double('file')
    test_obj = RegisterDashboard.new('testoutput', 'test-server-99', './dashboards/register_default_json.erb')

    allow(File).to receive(:open).with('output/testoutput-register.json', 'w+').and_return(file_mock)
    output = test_obj.render()
    test_obj.save()

    allow(File).to receive(:open).and_return(file_mock)
    expect(output).to include('"host": "test-server-99"')
  end

  it 'Renders RegisterFromHash with correct values' do
    file_mock = double('file')
    test_data = {host: 'alice-1', tag: 'uat'}
    test_obj = RegisterFromHash.new('testoutput', test_data, './dashboards/from_has_example_json.erb')

    allow(File).to receive(:open).with('output/testoutput-register.json', 'w+').and_return(file_mock)
    output = test_obj.render()
    test_obj.save()

    allow(File).to receive(:open).and_return(file_mock)
    expect(output).to include('"host": "alice-1"')
    expect(output).to include('"tag": "uat"')
    end
end
