require 'puppetlabs_spec_helper/puppetlabs_spec_helper'
#require 'spec_helper'

describe 'users', :type => :class do

  it {should contain_class('users') }

end
