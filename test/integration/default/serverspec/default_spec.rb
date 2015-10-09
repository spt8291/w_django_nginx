require 'spec_helper'

describe 'w_django_nginx::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'does something' do
    skip 'Replace this with meaningful tests'
  end

  describe package('nginx') do
  	it { should be_installed }
  end

  describe file('/etc/nginx/sites-available/website') do
  	it { should be_file }
  	its(:content) { should match /var\/www\/nginx-default/ }
	end

  describe file('/etc/nginx/sites-enabled/website') do
  	it { should be_symlink }
  end

  describe package('libjpeg-dev') do
  	it { should be_installed }
  end
end