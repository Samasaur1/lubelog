{ lib, buildDotnetModule, dotnetCorePackages, dotnet-aspnetcore_8 }:

buildDotnetModule rec {
  pname = "lubelog";
  version = "0.1";

  src = ./.;

  projectFile = "CarCareTracker.sln";
  nugetDeps = ./deps.nix; # File generated with `nix-build -A package.passthru.fetch-deps`.

  dotnet-sdk = dotnetCorePackages.sdk_8_0;
  # dotnet-runtime = dotnetCorePackages.runtime_8_0;
  dotnet-runtime = dotnetCorePackages.aspnetcore_8_0;

  makeWrapperArgs = [
    "--set DOTNET_CONTENTROOT ${placeholder "out"}/lib/lubelog"
  ];

  executables = [ "CarCareTracker" ]; # This wraps "$out/lib/$pname/foo" to `$out/bin/foo`.

  packNupkg = true; # This packs the project as "foo-0.1.nupkg" at `$out/share`.

  # runtimeDeps = [ dotnet-aspnetcore_8 ];
}
