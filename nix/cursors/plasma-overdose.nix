# Plasma Overdose cursors — Notify-ctrl/Plasma-Overdose
# Single variant. Pre-built cursors shipped in git under cursors/
pkgs: lib:
let
  src = pkgs.fetchFromGitHub {
    owner  = "Notify-ctrl";
    repo   = "Plasma-Overdose";
    rev    = "7ac698117537e1cf7fdef3bbd981443b98f17a8b";
    sha256 = "17719jx80c8l9ijddj6n34qzrmassiahvj57xjcmj0f9cdxb63bh";
  };
in
{
  package = pkgs.runCommand "plasma-overdose-cursors" { } ''
    mkdir -p $out/share/icons
    cp -r ${src}/cursors $out/share/icons/Plasma-Overdose
  '';
  name = "Plasma-Overdose";
}
