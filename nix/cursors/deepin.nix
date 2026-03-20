# DeepinV20 cursors — yeyushengfan258
# Two separate repos: DeepinV20-white-cursors and DeepinV20-dark-cursors
# Pre-built cursors shipped in git under dist/
pkgs: lib:
let
  mkPkg = { owner, repo, rev, sha256, name }:
    let
      src = pkgs.fetchFromGitHub { inherit owner repo rev sha256; };
    in
    pkgs.runCommand "deepin-${name}" { } ''
      mkdir -p $out/share/icons
      cp -r ${src}/dist $out/share/icons/${name}
    '';

  white = mkPkg {
    owner  = "yeyushengfan258";
    repo   = "DeepinV20-white-cursors";
    rev    = "5a5f0fad392c31b40db44db6f1a77d3e3194e53e";
    sha256 = "01gn3q64326h4j60ba3sfsx8arc7yybgyg67x2mspz0abccsv552";
    name   = "DeepinV20-White";
  };

  dark = mkPkg {
    owner  = "yeyushengfan258";
    repo   = "DeepinV20-dark-cursors";
    rev    = "b8a6de9a566b667b86329b0bd500e77fadbaaf5e";
    sha256 = "1bmnjgxz5q8m0ianhyvms4z7ikkac8ik2mh9g8par06nclyg0dxk";
    name   = "DeepinV20-Dark";
  };
in
{
  inherit white dark;
  names = {
    white = "DeepinV20-White";
    dark  = "DeepinV20-Dark";
  };
}
