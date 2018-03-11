package_name =
  service_name =
    case node['platform']
    when 'centos' then 'httpd'
    when 'ubuntu' then 'apache2'
    end

package package_name

service service_name do
  action [:enable, :start]
end

#custom home page.
# when we want to access Attribute in recipe declare default['greeting'] = 'bhupesh' in /attribute/webatt.rb
# and within Double Quotes block of Statement <html>#{node['greeting']}</html>
file '/var/www/html/index.html' do
  content "<html>
  <body>
    <h1>Welcome IBM</h1>
    <h1>#{node['greeting']}</h1>
    <h1>#{node['hostname']}</h1>
    <h1>#{node['ipaddress']}</h1>
    <h1>#{node['fqdn']}</html>
  </body>
</html>"
end

file "/var/lib/#{node['fileName']}" do
end

template 'var/www/html/index.html' do
  source 'index.html.erb'
end
