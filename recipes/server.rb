#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Checking package httpd has been installed

package_name =
  service_name =
    case node['platform']
    when 'centos' then 'httpd'
    #when 'ubuntu' then 'apache2'
    end

package package_name

service service_name do
  action [:enable, :start]
end
