# Run sqlplus for interactive vagrant login
class profile::oracle::tryme {
  file { '/bin/tryme':
    content => "#!/bin/bash\nif [[ \$TERM == xterm ]]; then\n  /usr/bin/sudo su - oracle -c 'ORACLE_SID=test sqlplus / as sysdba'\nfi\nexec /bin/bash \"\$@\"\n",
    mode    => '0755',
  }
  augeas { 'Tryme shell':
    changes => 'set /files/etc/shells/0 /bin/tryme',
    onlyif  => 'match /files/etc/shells/*[. = "/bin/tryme"] size == 0',
  }
  ->
  user { 'vagrant':
    shell => '/bin/tryme',
  }
}
