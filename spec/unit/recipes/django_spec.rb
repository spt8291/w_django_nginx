#
# Cookbook Name:: w_django_nginx
# Spec:: default
#
# Copyright 2015 The Authors
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

require 'spec_helper'

describe 'w_django_nginx::django' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'install python-dev package' do
      expect(chef_run).to install_package('python-dev')
    end
    
    it 'install gcc package' do
      expect(chef_run).to install_package('gcc')
    end

    it 'includes the nginx recipe' do
      expect(chef_run).to include_recipe('poise-python::default')
    end 

    it 'execute wagtail start website' do
     expect(chef_run).to run_execute('wagtail start website').with(command: 'wagtail start website', cwd: '/opt/')
    end 

    it 'execute migrate' do
     expect(chef_run).to run_execute('migrate').with(command: './manage.py migrate', cwd: '/opt/website/')
    end 

    it 'execute createsuperuser' do
     expect(chef_run).to run_execute('createsuperuser').with(command: './manage.py createsuperuser', cwd: '/opt/website/')
    end 

    it 'execute runserver' do
     expect(chef_run).to run_execute('runserver').with(command: './manage.py runserver', cwd: '/opt/website/')
    end 

  end
end
