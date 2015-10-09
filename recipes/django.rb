package 'python-dev'
package 'gcc'

include_recipe 'poise-python'

python_package 'wagtail' 

execute 'wagtail start website' do
  command 'wagtail start website'
  cwd '/opt/'
end

application '/opt/website' do
  virtualenv
  pip_requirements
end

execute 'migrate' do
  command './manage.py migrate'
  cwd '/opt/website/'
end

execute 'createsuperuser' do
  command './manage.py createsuperuser'
  cwd '/opt/website/'
end

execute 'runserver' do
  command './manage.py runserver'
  cwd '/opt/website/'
end



