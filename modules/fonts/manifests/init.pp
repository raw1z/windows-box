class fonts {
  file {
    "fonts-archive":
      path               => 'c:\temp\fonts.zip',
      source             => 'puppet:///modules/fonts/fonts.zip',
      source_permissions => ignore,
      ensure             => present;

    "console-fonts":
      path               => 'c:\temp\console_fonts.reg',
      source             => 'puppet:///modules/fonts/console_fonts.reg',
      source_permissions => ignore,
      ensure             => present;

    "add-font-script":
      path               => 'c:\temp\Add-Font.ps1',
      source             => 'puppet:///modules/fonts/Add-Font.ps1',
      source_permissions => ignore,
      ensure             => present
  }

  exec {
    "extract-fonts":
      require => File["fonts-archive"],
      command => 'cmd /C 7za e -o"C:\temp\fonts" c:\temp\fonts.zip',
      unless  => 'cmd /C dir c:\temp\fonts';

    "install-fonts":
      require  => Exec["extract-fonts"],
      command  => 'c:\temp\Add-Font.ps1 -path "c:\temp\fonts"',
      unless   => 'cmd /C dir C:\temp\fonts\Anonymous.ttf',
      provider => powershell;

    "register-console-fonts":
      require => File["console-fonts"],
      command => 'cmd /C reg import c:\temp\console_fonts.reg'
  }
}
