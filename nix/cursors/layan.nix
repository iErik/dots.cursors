# Layan cursors — vinceliuice/Layan-cursors
# Variants: standard, border, white
# Pre-built cursors shipped in git (dist/, dist-border/, dist-white/)
pkgs: lib:
let
  src = pkgs.fetchFromGitHub {
    owner  = "vinceliuice";
    repo   = "Layan-cursors";
    rev    = "b8c46895b64ac52ee538629d274a2787b3c0921e";
    sha256 = "03lfddkirjiw5r1g0m015mzhyyabsg4cd148w33b560y1l129yir";
  };

  mkPkg = { srcDir, name }:
    pkgs.runCommand "layan-${name}" { } ''
      mkdir -p $out/share/icons
      cp -r ${src}/${srcDir} $out/share/icons/${name}
    '';

  packages = {
    standard = mkPkg { srcDir = "dist";        name = "Layan-cursors";        };
    border   = mkPkg { srcDir = "dist-border"; name = "Layan-border-cursors"; };
    white    = mkPkg { srcDir = "dist-white";  name = "Layan-white-cursors";  };
  };

  names = {
    standard = "Layan-cursors";
    border   = "Layan-border-cursors";
    white    = "Layan-white-cursors";
  };
in
{ inherit packages names; }
