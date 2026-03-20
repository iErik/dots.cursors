# Bibata cursor — ful1e5/Bibata_Cursor v2.0.7
# Variants: modern/original × amber/classic/ice
pkgs: lib:
let
  mkPkg = { name, hash }:
    let
      src = pkgs.fetchzip {
        url = "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/${name}.tar.xz";
        sha256 = hash;
      };
    in
    pkgs.runCommand name { } ''
      mkdir -p $out/share/icons/${name}
      cp -r ${src}/. $out/share/icons/${name}/
    '';

  packages = {
    modern-amber    = mkPkg { name = "Bibata-Modern-Amber";    hash = "103d25mijpff9magxhgjyzia4aj03x519bxr0ssj54zima2d6cna"; };
    modern-classic  = mkPkg { name = "Bibata-Modern-Classic";  hash = "0s865gv5qfdgcd5dhl2nmsl7ayl067rs658h5mamd042ahwp8myq"; };
    modern-ice      = mkPkg { name = "Bibata-Modern-Ice";      hash = "01acywlhs45hisa16ydmyq5r8zr49f7rnf6smz6k3x6avm0wsvs8"; };
    original-amber  = mkPkg { name = "Bibata-Original-Amber";  hash = "1m57d26hqixrv1hc3ixc7yqgxpc08xqfps2m5k9rqy76j49hdhkq"; };
    original-classic= mkPkg { name = "Bibata-Original-Classic";hash = "1q0lrk5hcqqf843z6w3h3g8gdjs8635ddafmsr7m5nvrj7cc6my4"; };
    original-ice    = mkPkg { name = "Bibata-Original-Ice";    hash = "1myz35a2a6wxnb33hzi0ff203r4w9m5nxxxk2lgq7mfhap2rgls5"; };
  };

  names = {
    modern-amber     = "Bibata-Modern-Amber";
    modern-classic   = "Bibata-Modern-Classic";
    modern-ice       = "Bibata-Modern-Ice";
    original-amber   = "Bibata-Original-Amber";
    original-classic = "Bibata-Original-Classic";
    original-ice     = "Bibata-Original-Ice";
  };
in
{ inherit packages names; }
