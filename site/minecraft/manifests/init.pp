class minecraft (

  $jar_url     = 'https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar',
  $java_url    = 'https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm',
  $install_dir = '/opt/minecraft',
){
  file { $install_dir:
    ensure => directory,
  }
  file { "${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $jar_url,
    before => Service['minecraft'],
  }
  package { 'jdk-17':
    ensure => present,
    source => $jar_url,
    install_options => ['--nogpgcheck'],
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    #source => 'puppet:///modules/minecraft/minecraft.service',
    content => epp('minecraft/minecraft.service','{
      install_dir => $install_dir, }')
  }
  service {'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']]
  }
  
}
