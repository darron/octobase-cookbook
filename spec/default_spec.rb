# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'octobase::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the `sysstat` recipe' do
    expect(chef_run).to include_recipe('sysstat::default')
  end

  it 'grabs and installs octo' do
    expect(chef_run).to create_remote_file('/usr/bin/octo')
  end

  it 'grabs and installs /etc/default/octohost' do
    expect(chef_run).to create_remote_file('/etc/default/octohost')
  end

  it 'updates /etc/sudoers' do
    expect(chef_run).to create_template('/etc/sudoers')
  end

  it 'updates /etc/ssh/sshd_config' do
    expect(chef_run).to create_template('/etc/ssh/sshd_config')
  end

  it 'restarts the ssh service with an explicit action' do
    expect(chef_run).to restart_service('ssh')
  end

  it 'grabs and installs jq' do
    expect(chef_run).to create_remote_file('/usr/bin/jq')
  end

  it 'creates the /usr/local/octohost folder' do
    expect(chef_run).to create_directory('/usr/local/octohost')
  end

  it 'creates the /usr/local/octohost/plugins folder' do
    expect(chef_run).to create_directory('/usr/local/octohost/plugins')
  end

  it 'checks out the mysql plugin' do
    expect(chef_run).to sync_git('/usr/local/octohost/plugins/mysql')
  end

end
