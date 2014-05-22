# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'octobase::default' do
  describe service('ssh') do
    it { should be_enabled }
    it { should be_running }
  end

  describe service('sysstat') do
    it { should be_enabled }
  end

  describe file('/usr/bin/octo') do
    it { should be_file }
  end

  describe file('/etc/default/octohost') do
    it { should be_file }
  end

  describe file('/usr/bin/jq') do
    it { should be_file }
  end

  describe file('/usr/local/octohost') do
    it { should be_directory }
  end

  describe file('/usr/local/octohost/plugins') do
    it { should be_directory }
  end
end
