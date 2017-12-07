#
# Cookbook:: apache
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

shared_examples 'apache' do |platform, version, package, service |
  context 'When run on  #{platform} #{version}' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      #runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs #{package}' do
      expect(chef_run).to install_package service
    end

    it 'enable the #{service} service ' do
      expect(chef_run).to enable_service service
    end

    it 'start the #{service} service ' do
      expect(chef_run).to start_service service
    end

  end
end

  describe 'apache::server' do
    platforms = {
      'centos' => ['6.8', 'httpd', 'httpd'],
      'ubuntu' => ['16.04', 'apache2', 'apache2']
    }

    platforms.each do | platform, platform_data|
      include_examples 'apache', platform, *platform_data
    end
  end
