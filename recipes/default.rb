# encoding: utf-8
#
# Cookbook Name:: octobase
# Recipe:: default
#
# Copyright (C) 2013, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'sysstat::default'

bash 'update_ulimit' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    echo '* hard nofile #{node['ulimit']}' >> /etc/security/limits.conf
    echo '* soft nofile #{node['ulimit']}' >> /etc/security/limits.conf
    sysctl -w fs.file-max=#{node['ulimit']}
    sysctl -p
  EOH
end

remote_file node['jq']['path'] do
  source node['jq']['url']
  owner 'root'
  group 'root'
  mode '00755'
  action :create
end

remote_file node['config']['path'] do
  source node['config']['url']
  owner 'root'
  group 'root'
  mode '00644'
  action :create
end

remote_file node['octo']['path'] do
  source node['octo']['url']
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

remote_file node['octologs']['path'] do
  source node['octologs']['url']
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

template node['sudoers'] do
  source 'sudoers.erb'
  mode 0440
  owner 'root'
  group 'root'
end

template node['sshd']['config'] do
  source 'sshd-config.erb'
  mode 0644
  owner 'root'
  group 'root'
end

directory node['octohost']['base_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

directory node['octohost']['plugin_dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

package 'git' do
  action :install
end

git "#{node['octohost']['plugin_dir']}/mysql" do
  repository 'https://github.com/octohost/mysql-plugin.git'
  action :sync
end

service 'ssh' do
  provider Chef::Provider::Service::Upstart
  action [:restart]
end
