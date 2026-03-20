# Bibata Rainbow cursor — ful1e5/Bibata_Cursor_Rainbow v1.1.2
# Variants: modern (round edges), original (sharp edges)
pkgs: lib:
let
  mkPkg = { name, hash }:
    let
      src = pkgs.fetchzip {
        url = "https://github.com/ful1e5/Bibata_Cursor_Rainbow/releases/download/v1.1.2/${name}.tar.gz";
        sha256 = hash;
      };
    in
    pkgs.runCommand name { } ''
      mkdir -p $out/share/icons/${name}
      cp -r ${src}/. $out/share/icons/${name}/
    '';

  packages = {
    modern = mkPkg {
      name = "Bibata-Rainbow-Modern";
      hash = "07qw5s7ppjkjg0l95nwi7l2msy4wyp7w3cfayh71r88hzhl8ikry";
    };
    original = mkPkg {
      name = "Bibata-Rainbow-Original";
      hash = "0jn1jxmsbyk2aijr5sbhp1vsncy5yvkzq40miwrlgq6q94f2j33j";
    };
  };

  names = {
    modern   = "Bibata-Rainbow-Modern";
    original = "Bibata-Rainbow-Original";
  };
in
{ inherit packages names; }
