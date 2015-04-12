require 'puppetlabs_spec_helper/puppetlabs_spec_helper'

describe 'users::params', :type => :class do

  it {should contain_class('users::params') }

end
