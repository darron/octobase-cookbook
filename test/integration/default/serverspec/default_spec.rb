# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'octobase::default' do
  describe service('ntp') do
    it { should be_enabled }
    it { should be_running }
  end
end
