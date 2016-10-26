package { ['libicu', 'libunwind','uuid']: }
->
package { 'powershell':
  source   => 'https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.11/powershell-6.0.0_alpha.11-1.el7.centos.x86_64.rpm',
  provider => 'rpm',
}

augeas { 'Powershell':
  changes => 'set /files/etc/shells/0 /bin/powershell',
  onlyif  => 'match /files/etc/shells/*[. = "/bin/powershell"] size == 0',
}
->
user { 'vagrant':
  shell => '/bin/powershell',
}
