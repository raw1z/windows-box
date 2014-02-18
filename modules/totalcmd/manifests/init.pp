class totalcmd {
  package { "TotalCommander":
    ensure => installed,
    provider => chocolatey
  }

  file { "viatc-archive":
    require => Package["TotalCommander"],
    source => "puppet:///modules/totalcmd/viatc.0.4.1.zip",
    path => 'c:\temp\viatc.zip',
    source_permissions => ignore
  }

  exec {
    "extract-viatc":
      require => File["viatc-archive"],
      command => 'cmd /C 7za e -o"c:\viatc" c:\temp\viatc.zip',
      unless => 'cmd /C dir c:\viatc';
  }
}
