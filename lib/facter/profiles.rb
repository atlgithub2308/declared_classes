# frozen_string_literal: true

Facter.add(:profiles) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  confine :declared_classes do |value|
    !"#{value}#{Facter.value[:declared_classes_w]}#{Facter.value[:declared_classes_l]}".empty?
  end
  setcode do
    v = "#{Facter.value(:declared_classes)} #{Facter.value(:declared_classes_w)} #{Facter.value(:declared_classes_l)} ".split(%r{[\n ]+}).reject do |x|
      x.nil? || x.empty?
    end
    v.select { |x| x.match?(%r{^profile::|::profile::}) }
  end
end
