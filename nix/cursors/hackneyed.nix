# Hackneyed X11 cursors — Enthymeme/hackneyed-x11-cursors v0.9.3
# Variants: light (Hackneyed), dark (Hackneyed-Dark)
# Built from source — requires inkscape, xcursorgen, jq
pkgs: lib:
let
  mkPkg = { variant }:
    let
      dark      = variant == "dark";
      themeName = if dark then "Hackneyed-Dark" else "Hackneyed";
    in
    pkgs.stdenv.mkDerivation {
      pname   = "hackneyed-${variant}";
      version = "0.9.3";

      src = pkgs.fetchzip {
        url    = "https://gitlab.com/Enthymeme/hackneyed-x11-cursors/-/archive/0.9.3/hackneyed-x11-cursors-0.9.3.tar.gz";
        sha256 = "0q62vjlhxw0gcadfsrzgc0pvcnqd31a2pmzm3ynwdrmmi42smbw2";
      };

      nativeBuildInputs = [
        pkgs.inkscape
        pkgs.xorg.xcursorgen
        pkgs.jq
        pkgs.fontconfig
      ];

      buildPhase = ''
        export HOME=$(mktemp -d)
        export FONTCONFIG_FILE="${pkgs.fontconfig.out}/etc/fonts/fonts.conf"
        patchShebangs .
        make theme \
          INKSCAPE="${pkgs.inkscape}/bin/inkscape" \
          XCURSORGEN="${pkgs.xorg.xcursorgen}/bin/xcursorgen" \
          JQ="${pkgs.jq}/bin/jq" \
          ${lib.optionalString dark "DARK_THEME=1"}
      '';

      installPhase = ''
        mkdir -p $out/share/icons
        cp -r ${themeName} $out/share/icons/
      '';
    };

  packages = {
    light = mkPkg { variant = "light"; };
    dark  = mkPkg { variant = "dark";  };
  };

  names = {
    light = "Hackneyed";
    dark  = "Hackneyed-Dark";
  };
in
{ inherit packages names; }
