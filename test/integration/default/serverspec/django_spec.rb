require 'spec_helper'

describe 'w_django_nginx::django' do

	describe package('python-dev') do
  	it { should be_installed }
	end

	describe package('gcc') do
  	it { should be_installed }
	end

	describe package('libxml2') do
  	it { should be_installed }
	end	
end