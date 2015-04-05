# Parameters class for ohmyzsh
class ohmyzsh::params {

  case $::osfamily {
    'Redhat', 'Darwin': {
      $zsh = '/bin/zsh'
    }
    default: {
      $zsh = '/usr/bin/zsh'
    }
  }

  case $::osfamily {
    'Darwin': {
      $package_provider = brew
      $home = '/Users'
      $manage_home = false
      $root = '/var/root'
      $user_home_cmd = 'dscl . -read /Users/mike NFSHomeDirectory | cut -d ' ' -f 2 | xargs test -e'
    }
    default: {
      $package_provider = undef
      $home = '/home'
      $root = '/root'
      $user_home_cmd = 'getent passwd ${name} | cut -d : -f 6 | xargs test -e'
    }
  }

}
