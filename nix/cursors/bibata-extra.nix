# Bibata Extra cursor — ful1e5/Bibata_Extra_Cursor v1.0.1
# Variants: modern/original × darkRed/dodgerBlue/pink/turquoise
pkgs: lib:
let
  mkPkg = { name, hash }:
    let
      src = pkgs.fetchzip {
        url = "https://github.com/ful1e5/Bibata_Extra_Cursor/releases/download/v1.0.1/${name}.tar.gz";
        sha256 = hash;
      };
    in
    pkgs.runCommand name { } ''
      mkdir -p $out/share/icons/${name}
      cp -r ${src}/. $out/share/icons/${name}/
    '';

  packages = {
    modern-darkRed      = mkPkg { name = "Bibata-Modern-DarkRed";      hash = "18h79zhkggdpawyv2j0lnjwb317w655sm2np7pd1sxpv0k9rpb2n"; };
    modern-dodgerBlue   = mkPkg { name = "Bibata-Modern-DodgerBlue";   hash = "0ifkpadmr38y4j27lh2jcns2f27gpzr9ba6p22ncva5wbs6q29d3"; };
    modern-pink         = mkPkg { name = "Bibata-Modern-Pink";         hash = "0yh1mhdsmiplpc1b8s9xmicvf6zkna51hhcl5h4wkj5m9ms6kzw2"; };
    modern-turquoise    = mkPkg { name = "Bibata-Modern-Turquoise";    hash = "0rll28wkvij7a66lg6l5g5s1czlg8k2qxarb01r0cvxg3xy2dshp"; };
    original-darkRed    = mkPkg { name = "Bibata-Original-DarkRed";    hash = "04il2393jzbw10xfxmgv6bnp0x3p4yka77gqx7h1c6nm6isnn6l7"; };
    original-dodgerBlue = mkPkg { name = "Bibata-Original-DodgerBlue"; hash = "1wwljvpwvmznjkk9pss6w95brv1axcg4gkcmp57rdssyy6ipj7j2"; };
    original-pink       = mkPkg { name = "Bibata-Original-Pink";       hash = "1ar5a4faxal27nc353323mn6v33mg9r1byz3zvzxxr8shy70hwhl"; };
    original-turquoise  = mkPkg { name = "Bibata-Original-Turquoise";  hash = "04f9yvwy1cmxp0dbmxwng3dqwgliwf4q4ph3wqdcq5iqa26p288n"; };
  };

  names = {
    modern-darkRed      = "Bibata-Modern-DarkRed";
    modern-dodgerBlue   = "Bibata-Modern-DodgerBlue";
    modern-pink         = "Bibata-Modern-Pink";
    modern-turquoise    = "Bibata-Modern-Turquoise";
    original-darkRed    = "Bibata-Original-DarkRed";
    original-dodgerBlue = "Bibata-Original-DodgerBlue";
    original-pink       = "Bibata-Original-Pink";
    original-turquoise  = "Bibata-Original-Turquoise";
  };
in
{ inherit packages names; }
