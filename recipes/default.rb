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

remote_file node['octo']['path'] do
  source node['octo']['url']
  owner 'root'
  group 'root'
  mode 00750
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

service 'ssh' do
  provider Chef::Provider::Service::Upstart
  action [:restart]
end
