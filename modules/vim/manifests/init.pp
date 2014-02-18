class vim {
  package {
    "Vim 7.4.27":
      ensure => installed,
      before => Exec["get-configuration"],
      provider => chocolatey;

    "python":
      ensure   => installed,
      provider => chocolatey;

    "ctags":
      ensure   => installed,
      provider => chocolatey
  }

  file {
    "custom-vimrc":
      path               => 'c:\temp\vimrc',
      source             => 'puppet:///modules/vim/vimrc',
      source_permissions => ignore;

    "custom-gvimrc":
      path               => 'c:\temp\gvimrc',
      source             => 'puppet:///modules/vim/gvimrc',
      source_permissions => ignore
  }
  
  exec {
    "get-configuration":
      require => Class['git'],
      command => 'cmd /C "git clone -b neobundle --recursive https://github.com/raw1z/vimfiles.git %HOME%\vimfiles"',
      unless => 'cmd /C "dir %HOME%\vimfiles"';

    "create-vimrc":
      require => Exec["get-configuration"],
      command => 'cmd /C "copy /A /Y %HOME%\vimfiles\vimrc %HOME%\_vimrc"',
      unless => 'cmd /C "type %HOME%\_vimrc"';

    "copy-custom-configuration":
      require => File['custom-vimrc', 'custom-gvimrc'],
      command => 'cmd /C "copy c:\temp\vimrc %HOME%\.vimrc.custom && copy c:\temp\gvimrc %HOME%\.gvimrc.custom"',
      unless  => 'cmd /C dir %HOME%\.vimrc.custom'
  }
}
