exec { "apt-update":
  command => "/usr/bin/apt-get -y update"
}

package { ["ubuntu-gnome-desktop"]:
    ensure => present,
    require => Exec["apt-update"]
}

package { ["ubuntu-restricted-extras"]:
    ensure => present,
    require => Exec["apt-update"]
}