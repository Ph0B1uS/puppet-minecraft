# frozen_string_literal: true

require 'spec_helper'

describe 'minecraft::server_setting', type: :define do
  let(:pre_condition) { 'include minecraft' }
  let(:params) do
    {
      content: '# this is a custom test config file',
    }
  end
  let(:title) { 'test' }

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let :title do
        'server.properties'
      end

      it { is_expected.to compile.with_all_deps }
    end
  end
end
