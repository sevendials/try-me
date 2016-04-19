$pash_base = '/usr/share'
$pash_dir  = "${pash_base}/Pash"
$pash_bin  = "${pash_dir}/Source/PashConsole/bin/Debug/Pash.exe"

package {'epel-release':
  ensure => installed,
}
->
package {['mono-devel','git']:
  ensure => installed,
}
->
exec { 'git clone https://github.com/Pash-Project/Pash.git':
  provider => 'shell',
  cwd      => $pash_base,
  creates  => $pash_dir,
}
->
exec { 'xbuild':
  provider => 'shell',
  cwd      => $pash_dir,
  creates  => $pash_bin,
}
->
file { '/bin/pash':
  content => "#!/bin/bash\nif [[ \$TERM == dummy ]] || [[ \$TERM == dumb ]]; then\n  exec /bin/bash \"\$@\"\nfi\nexec /usr/bin/mono ${pash_bin}\n",
  mode    => '0755',
}
augeas { 'Pash shell':
  changes => 'set /files/etc/shells/0 /bin/pash',
  onlyif  => 'match /files/etc/shells/*[. = "/bin/pash"] size == 0',
}
->
user { 'vagrant':
  shell => '/bin/pash',
}
