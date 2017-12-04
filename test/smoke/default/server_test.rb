# # encoding: utf-8

# Inspec test for recipe apache::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

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
