# # encoding: utf-8

# Inspec test for recipe apache::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('httpd') do
  it { should be_installed }
end


# Check httpd package is Installed, enabled and running
describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end


#Checking that the package directory exists
describe file('/etc/httpd') do
  it { should be_directory }
end

#Checking that the file exists and that the file contains a given string in httpd.confog file
describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_a_file }
  its(:content) { should match(/User apache/) }
  its(:content) { should match(/Group apache/) }
end

# make sure when we run  curl localhost in testing container display the welcome page
describe command("curl localhost") do
     its("stdout") { should match "Welcome IBM" }
end

#Checking  default http port 80 is opened to access webpage from other machine.
describe port(80) do
  it { should be_listening }
end
