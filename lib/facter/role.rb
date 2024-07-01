# frozen_string_literal: true

Facter.add(:role) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  confine :declared_classes do |value|
    ! "#{value}#{Facter.value[:declared_classes_w]}#{Facter.value[:declared_classes_l]}".empty?
  end
  setcode do
    "#{Facter.value(:declared_classes)} #{Facter.value(:declared_classes_w)} #{Facter.value(:declared_classes_l)} ".split(%r{[\n ]+}).reject{|x| x.nil? || x.empty? }.select{|x| x.match?(%r{^role::|::role::})}
  end
end
