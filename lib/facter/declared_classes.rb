 Facter.add(:declared_classes_l) do
   confine :osfamily => ['Debian', 'RedHat']
   #confine :operatingsystemmajrelease => '10'
   setcode do
     s = Facter::Core::Execution.exec(
       'cat /opt/puppetlabs/puppet/cache/state/classes.txt '
     )
   end
 end

 Facter.add(:declared_classes_w) do
  confine :osfamily => 'windows'
  setcode do
    s = Facter::Core::Execution.exec(
      'powershell "cat C:\ProgramData\PuppetLabs\puppet\cache\state\classes.txt" '
    )
  end
end
