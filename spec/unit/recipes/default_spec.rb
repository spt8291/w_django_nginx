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

describe 'w_django_nginx::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    before do
    	stub_command('which nginx').and_return(false)
    end

    it 'includes the nginx recipe' do
      expect(chef_run).to include_recipe('nginx::default')
    end  

    it 'enable nginx site website' do
      expect(chef_run).to enable_nginx_site('website')
    end  

    it 'check site-available/enable conf file' do
    	expect(chef_run).to render_file('/etc/nginx/sites-available/website')
    end

    it 'installs libjpeg-dev' do
    	expect(chef_run).to install_package('libjpeg-dev')
    end

    it 'includes the django recipe' do
      expect(chef_run).to include_recipe('w_django_nginx::django')
    end  

	end
end
