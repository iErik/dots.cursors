# Sunset cursors — yeyushengfan258/Sunset-Cursors
# Single variant. Pre-built cursors shipped in git under dist/
pkgs: lib:
let
  src = pkgs.fetchFromGitHub {
    owner  = "yeyushengfan258";
    repo   = "Sunset-Cursors";
    rev    = "21f5fb60fae4f81fbdd9957b3b1cdf8b0248f923";
    sha256 = "0nf52wklahmar99331zx8gwyw0bmvqi890zln0ls1vf2rwv03nsy";
  };
in
{
  package = pkgs.runCommand "sunset-cursors" { } ''
    mkdir -p $out/share/icons
    cp -r ${src}/dist $out/share/icons/Sunset-Cursors
  '';
  name = "Sunset-Cursors";
}
