# umbrella class
class profile::oracle {
  class { 'profile::oracle::prereqs': } ->
  class { 'profile::oracle::install': } ->
  class { 'profile::oracle::listener': } ->
  class { 'profile::oracle::tnsnames': } ->
  class { 'profile::oracle::database': } ~>
  class { 'profile::oracle::autostart': }
}
