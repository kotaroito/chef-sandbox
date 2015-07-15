require 'spec_helper'

describe command('ls ~/.rbenv/versions/2.2.2') do
  its(:stdout) { should match /lib/ }
end
