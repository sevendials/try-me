# installs prereqs as described in oradb README
class profile::oracle::prereqs {
  $all_groups = ['oinstall','dba' ,'oper']
  group { $all_groups :
    ensure      => present,
  }

  user { 'oracle':
    ensure     => present,
    gid        => 'oinstall',
    groups     => ['oinstall','dba','oper'],
    shell      => '/bin/bash',
    password   => '$1$DSJ51vh6$4XzzwyIOk6Bi/54kglGk3.',
    home       => '/home/oracle',
    comment    => 'This user oracle was created by Puppet',
    require    => Group[$all_groups],
    managehome => true,
  }

  Sysctl { ensure => 'present', permanent => 'yes', }
  sysctl { 'kernel.msgmnb':                 value => '65536',}
  sysctl { 'kernel.msgmax':                 value => '65536',}
  sysctl { 'kernel.shmmax':                 value => '2588483584',}
  sysctl { 'kernel.shmall':                 value => '2097152',}
  sysctl { 'fs.file-max':                   value => '6815744',}
  sysctl { 'net.ipv4.tcp_keepalive_time':   value => '1800',}
  sysctl { 'net.ipv4.tcp_keepalive_intvl':  value => '30',}
  sysctl { 'net.ipv4.tcp_keepalive_probes': value => '5',}
  sysctl { 'net.ipv4.tcp_fin_timeout':      value => '30',}
  sysctl { 'kernel.shmmni':                 value => '4096', }
  sysctl { 'fs.aio-max-nr':                 value => '1048576',}
  sysctl { 'kernel.sem':                    value => '250 32000 100 128',}
  sysctl { 'net.ipv4.ip_local_port_range':  value => '9000 65500',}
  sysctl { 'net.core.rmem_default':         value => '262144',}
  sysctl { 'net.core.rmem_max':             value => '4194304', }
  sysctl { 'net.core.wmem_default':         value => '262144',}
  sysctl { 'net.core.wmem_max':             value => '1048576',}

  class { 'limits':
    config    => {
      '*'      => {
        'nofile' => {
          soft => '2048',
          hard => '8192',
        },
      },
      'oracle' => {
        'nofile' => {
          soft => '65536',
          hard => '65536',
        },
        'nproc'  => {
          soft => '2048',
          hard => '16384',
        },
        'stack'  => {
          soft => '10240',
        },
      },
    },
    use_hiera => false,
  }
  $install = [
    'binutils.x86_64', 'compat-libstdc++-33.x86_64', 'glibc.x86_64',
    'ksh.x86_64','libaio.x86_64', 'libgcc.x86_64', 'libstdc++.x86_64',
    'make.x86_64','compat-libcap1.x86_64', 'gcc.x86_64', 'gcc-c++.x86_64',
    'glibc-devel.x86_64','libaio-devel.x86_64','libstdc++-devel.x86_64',
    'sysstat.x86_64','unixODBC-devel','glibc.i686','libXext.x86_64',
    'libXtst.x86_64'
  ]

  package { $install:
    ensure  => present,
  }
}
