require 'spec_helper'

describe 'autofs::nis' do 

  let(:chef_run) do 
    ChefSpec::Runner.new(platform: platform, version: version).converge(described_recipe)
  end

  ######################################################################
  # Tests specific to Ubuntu                                           #
  ######################################################################

  context 'On Ubuntu 14.04' do

    let(:platform) { 'ubuntu' } 
    let(:version) { '14.04' }    
    
  end

  ######################################################################
  # Tests specific to CentOS                                           #
  ######################################################################

  context 'On CentOS 6.5' do

    let(:platform) { 'centos' } 
    let(:version) { '6.5' }  

  end

  ######################################################################
  # Tests common to all platforms                                      #
  ######################################################################
  context 'On all platforms' do

    let(:chef_run) do
      ChefSpec::Runner.new.converge(described_recipe)
    end

    it 'installs the correct package' do
      expect(chef_run).to install_package('autofs')
    end

    it 'includes the nis::default recipe' do
      expect(chef_run).to include_recipe('nis::default')
    end

  end

end
