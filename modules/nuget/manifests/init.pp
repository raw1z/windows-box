class nuget {
  package { "NuGet.CommandLine":
    ensure   => installed,
    provider => chocolatey
  }
}
