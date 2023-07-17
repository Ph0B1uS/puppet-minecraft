# frozen_string_literal: true

require 'spec_helper'

describe 'minecraft::plugin', type: :define do
  let :pre_condition do
    'include ::minecraft'
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end
      let :title do
        'dynmap'
      end
      let :params do
        {
          source: 'https://mediafilez.forgecdn.net/files/4632/182/Dynmap-3.6-spigot.jar'
        }
      end

      it { is_expected.to compile.with_all_deps }

      it 'downloads the plugin' do
        is_expected.to contain_archive('dynmap').with(ensure: 'present',
                                                      path: '/opt/minecraft/plugins/dynmap.jar',
                                                      user: 'minecraft',
                                                      source: 'https://mediafilez.forgecdn.net/files/4632/182/Dynmap-3.6-spigot.jar')
      end

      it 'depends on plugin dir' do
        is_expected.to contain_archive('dynmap').that_requires('File[/opt/minecraft/plugins]')
      end

      it 'depends on minecraft user' do
        is_expected.to contain_archive('dynmap').that_requires('User[minecraft]')
      end

      it 'enforces plugin ownership' do
        is_expected.to contain_file('/opt/minecraft/plugins/dynmap.jar').with(ensure: 'file',
                                                                              owner: 'minecraft',
                                                                              group: 'minecraft',
                                                                              mode: '0644').that_requires('Archive[dynmap]')
      end
    end
  end
end
