# XCursor Pro — ful1e5/XCursor-pro v2.0.2
# Variants: dark, light, red
pkgs: lib:
let
  mkPkg = { name, hash }:
    let
      src = pkgs.fetchzip {
        url    = "https://github.com/ful1e5/XCursor-pro/releases/download/v2.0.2/${name}.tar.xz";
        sha256 = hash;
      };
    in
    pkgs.runCommand name { } ''
      mkdir -p $out/share/icons/${name}
      cp -r ${src}/. $out/share/icons/${name}/
    '';

  packages = {
    dark  = mkPkg { name = "XCursor-Pro-Dark";  hash = "0kij8nrm84jggkasaky1xw00fd2rw5v52lych57chplg25cycnn7"; };
    light = mkPkg { name = "XCursor-Pro-Light"; hash = "0zd9z72f0994v4fww4h7dmf0n1znd2l7ip345rznc6dbq4gkkcp7"; };
    red   = mkPkg { name = "XCursor-Pro-Red";   hash = "11mqryr03vvb0bp81y4plrw80sj41fmbihhz0rkvdz1w2xsvqgbm"; };
  };

  names = {
    dark  = "XCursor-Pro-Dark";
    light = "XCursor-Pro-Light";
    red   = "XCursor-Pro-Red";
  };
in
{ inherit packages names; }
