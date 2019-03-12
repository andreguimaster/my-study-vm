exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

package { ["ubuntu-desktop"]:
    ensure => present,
    require => Exec["apt-update"]
}

package { ["virtualbox-guest-utils","virtualbox-guest-dkms"]:
    ensure => present,
    require => Package["ubuntu-desktop"]
}