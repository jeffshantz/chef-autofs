require 'spec_helper'

describe 'autofs::nis' do

  describe 'nis service' do
    it 'is running' do
      expect(service('ypbind')).to be_running
    end
  end

  describe 'autofs service' do
    it 'is running' do
      expect(service('autofs')).to be_running
    end
  end

end
