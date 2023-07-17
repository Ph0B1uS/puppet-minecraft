# frozen_string_literal: true

require 'spec_helper'

describe 'minecraft::server_setting', type: :define do
  let :pre_condition do
    'include ::minecraft'
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let :title do
        'dynmap'
      end
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
