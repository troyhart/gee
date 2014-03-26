
class { 'java':
  distribution => 'jdk',
  version      => 'latest',
}
 
package { 'artifactory':
  provider => rpm,
  source  => 'http://dl.bintray.com/content/jfrog/artifactory-rpms/artifactory-3.1.1.1.rpm',
  ensure  => installed,
  require => Class['java']
}
-> 
service { 'artifactory':
  ensure => running,
  enable => true,
}

package { 'wget':
  ensure => installed,
}

user {'teamcity':
  ensure => present,
}

file { '/home/teamcity':
  ensure => directory,
  owner => teamcity,
}

exec { 'download-teamcity':
  command => "/usr/bin/wget http://download.jetbrains.com/teamcity/TeamCity-8.1.1.tar.gz -O /tmp/TeamCity.tar.gz",
  creates => "/tmp/TeamCity.tar.gz",
  require => Package['wget'],
  timeout => 0,
  user => teamcity,
}
->
exec { 'extract-teamcity':
  command => "/bin/tar -zxf /tmp/TeamCity.tar.gz -C /home/teamcity",
  creates => "/home/teamcity/TeamCity",
  require =>  [ File['/home/teamcity'], User['teamcity'] ],
  user => teamcity,
}
->
exec { 'run-teamcity':
  command => "/home/teamcity/TeamCity/bin/runAll.sh start",
  cwd => "/home/teamcity",
  require => User['teamcity'],
  user => teamcity,
}

package {'git':
  ensure => installed,
}

service { 'iptables': 
  ensure => stopped
}
