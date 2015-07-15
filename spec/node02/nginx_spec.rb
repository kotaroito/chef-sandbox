require 'spec_helper'

describe package('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe file('/etc/nginx/sites-available/default') do
  it { should be_file }
end

describe file('/var/log/nginx/access.log') do
  it { should exist }
end

describe process('nginx') do
  it { should be_running }
end
