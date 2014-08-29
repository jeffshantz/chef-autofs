#
# Cookbook Name:: autofs
# Recipe:: nis
#
# Copyright 2014, Western University
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

include_recipe 'nis'

package 'autofs' do
  action :install
end

service "autofs" do
  supports :restart => true
  action :enable
  subscribes :restart, "service[nis]"  # Restart this service if the nis service changes state
end

# TODO: Write the autofs configuration (the location of which differs depending on the platform)
# value_for_platform(/etc/default/autofs
# /etc/sysconfig/autofs

template "/etc/default/autofs" do
  source   "autofs.erb"
  mode     "0644"
  owner    "root"
  group    "root"
  variables ({
    mount_timeout: node[:autofs][:timeout],
    browse_mode: node[:autofs][:browse_mode],
    nfs_options: node[:autofs][:options]
  })
  notifies :restart, "service[autofs]"
end