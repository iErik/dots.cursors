self: { config, lib, pkgs, ... }:

let
  cfg = config.dots.cursors;

  # Import per-cursor package definitions
  bibataRainbow  = import ./cursors/bibata-rainbow.nix  pkgs lib;
  bibata         = import ./cursors/bibata.nix          pkgs lib;
  bibataExtra    = import ./cursors/bibata-extra.nix    pkgs lib;
  layan          = import ./cursors/layan.nix           pkgs lib;
  capitaine      = import ./cursors/capitaine.nix       pkgs lib;
  deepin         = import ./cursors/deepin.nix          pkgs lib;
  sunset         = import ./cursors/sunset.nix          pkgs lib;
  plasmaOverdose = import ./cursors/plasma-overdose.nix pkgs lib;
  hackneyed      = import ./cursors/hackneyed.nix       pkgs lib;
  xcursorPro     = import ./cursors/xcursor-pro.nix     pkgs lib;

  # Per-cursor config aliases
  cfgBR  = cfg.bibataRainbow;
  cfgB   = cfg.bibata;
  cfgBE  = cfg.bibataExtra;
  cfgL   = cfg.layan;
  cfgC   = cfg.capitaine;
  cfgDW  = cfg.deepinWhite;
  cfgDD  = cfg.deepinDark;
  cfgS   = cfg.sunset;
  cfgPO  = cfg.plasmaOverdose;
  cfgH   = cfg.hackneyed;
  cfgXP  = cfg.xcursorPro;

  # Registry: one entry per pointerCursor ID.
  # Each entry is evaluated lazily — only the selected cursor is forced.
  cursorRegistry = {
    bibataRainbow = {
      package = bibataRainbow.packages.${cfgBR.variant};
      pointerCursor = {
        package    = bibataRainbow.packages.${cfgBR.variant};
        name       = bibataRainbow.names.${cfgBR.variant};
        size       = cfgBR.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    bibata = {
      package = bibata.packages.${cfgB.variant};
      pointerCursor = {
        package    = bibata.packages.${cfgB.variant};
        name       = bibata.names.${cfgB.variant};
        size       = cfgB.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    bibataExtra = {
      package = bibataExtra.packages.${cfgBE.variant};
      pointerCursor = {
        package    = bibataExtra.packages.${cfgBE.variant};
        name       = bibataExtra.names.${cfgBE.variant};
        size       = cfgBE.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    layan = {
      package = layan.packages.${cfgL.variant};
      pointerCursor = {
        package    = layan.packages.${cfgL.variant};
        name       = layan.names.${cfgL.variant};
        size       = cfgL.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    capitaine = {
      package = capitaine.package;
      pointerCursor = {
        package    = capitaine.package;
        name       = capitaine.names.${cfgC.variant};
        size       = cfgC.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    deepinWhite = {
      package = deepin.white;
      pointerCursor = {
        package    = deepin.white;
        name       = deepin.names.white;
        size       = cfgDW.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    deepinDark = {
      package = deepin.dark;
      pointerCursor = {
        package    = deepin.dark;
        name       = deepin.names.dark;
        size       = cfgDD.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    sunset = {
      package = sunset.package;
      pointerCursor = {
        package    = sunset.package;
        name       = sunset.name;
        size       = cfgS.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    plasmaOverdose = {
      package = plasmaOverdose.package;
      pointerCursor = {
        package    = plasmaOverdose.package;
        name       = plasmaOverdose.name;
        size       = cfgPO.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    hackneyed = {
      package = hackneyed.packages.${cfgH.variant};
      pointerCursor = {
        package    = hackneyed.packages.${cfgH.variant};
        name       = hackneyed.names.${cfgH.variant};
        size       = cfgH.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
    xcursorPro = {
      package = xcursorPro.packages.${cfgXP.variant};
      pointerCursor = {
        package    = xcursorPro.packages.${cfgXP.variant};
        name       = xcursorPro.names.${cfgXP.variant};
        size       = cfgXP.size;
        gtk.enable = true;
        x11.enable = true;
      };
    };
  };

  # Helper: shared option definitions
  mkEnableOpt  = desc:     lib.mkOption { type = lib.types.bool; default = false; description = desc; };
  mkVariantOpt = vs: d:    lib.mkOption { type = lib.types.enum vs; default = d; description = "Cursor variant."; };
  mkSizeOpt    =           lib.mkOption { type = lib.types.int; default = 24; description = "Cursor size in pixels."; };

in
{
  options.dots.cursors = {

    enable = lib.mkEnableOption "all cursor packages defined in this flake";

    pointerCursor = lib.mkOption {
      type    = lib.types.nullOr (lib.types.enum [
        "bibataRainbow"
        "bibata"
        "bibataExtra"
        "layan"
        "capitaine"
        "deepinWhite"
        "deepinDark"
        "sunset"
        "plasmaOverdose"
        "hackneyed"
        "xcursorPro"
      ]);
      default     = null;
      description = ''
        ID of the cursor to configure as home.pointerCursor.
        The named cursor is installed even if its enable flag is false.
        When null, home.pointerCursor is left unconfigured.
      '';
    };

    # ── Bibata Rainbow ────────────────────────────────────────────────────────
    bibataRainbow = {
      enable  = mkEnableOpt "Install Bibata Rainbow cursor.";
      variant = mkVariantOpt [ "modern" "original" ] "modern";
      size    = mkSizeOpt;
    };

    # ── Bibata ────────────────────────────────────────────────────────────────
    bibata = {
      enable  = mkEnableOpt "Install Bibata cursor.";
      variant = mkVariantOpt [
        "modern-amber" "modern-classic" "modern-ice"
        "original-amber" "original-classic" "original-ice"
      ] "modern-classic";
      size = mkSizeOpt;
    };

    # ── Bibata Extra ──────────────────────────────────────────────────────────
    bibataExtra = {
      enable  = mkEnableOpt "Install Bibata Extra cursor.";
      variant = mkVariantOpt [
        "modern-darkRed" "modern-dodgerBlue" "modern-pink" "modern-turquoise"
        "original-darkRed" "original-dodgerBlue" "original-pink" "original-turquoise"
      ] "modern-pink";
      size = mkSizeOpt;
    };

    # ── Layan ─────────────────────────────────────────────────────────────────
    layan = {
      enable  = mkEnableOpt "Install Layan cursor.";
      variant = mkVariantOpt [ "standard" "border" "white" ] "standard";
      size    = mkSizeOpt;
    };

    # ── Capitaine ─────────────────────────────────────────────────────────────
    capitaine = {
      enable  = mkEnableOpt "Install Capitaine cursor (via pkgs.capitaine-cursors).";
      variant = mkVariantOpt [ "dark" "white" ] "dark";
      size    = mkSizeOpt;
    };

    # ── DeepinV20 White ───────────────────────────────────────────────────────
    deepinWhite = {
      enable = mkEnableOpt "Install DeepinV20 White cursor.";
      size   = mkSizeOpt;
    };

    # ── DeepinV20 Dark ────────────────────────────────────────────────────────
    deepinDark = {
      enable = mkEnableOpt "Install DeepinV20 Dark cursor.";
      size   = mkSizeOpt;
    };

    # ── Sunset ────────────────────────────────────────────────────────────────
    sunset = {
      enable = mkEnableOpt "Install Sunset cursor.";
      size   = mkSizeOpt;
    };

    # ── Plasma Overdose ───────────────────────────────────────────────────────
    plasmaOverdose = {
      enable = mkEnableOpt "Install Plasma Overdose cursor.";
      size   = mkSizeOpt;
    };

    # ── Hackneyed ─────────────────────────────────────────────────────────────
    hackneyed = {
      enable  = mkEnableOpt "Install Hackneyed cursor (built from source).";
      variant = mkVariantOpt [ "light" "dark" ] "light";
      size    = mkSizeOpt;
    };

    # ── XCursor Pro ───────────────────────────────────────────────────────────
    xcursorPro = {
      enable  = mkEnableOpt "Install XCursor Pro cursor.";
      variant = mkVariantOpt [ "dark" "light" "red" ] "dark";
      size    = mkSizeOpt;
    };

  };

  config = lib.mkMerge [

    # ── Cascade master enable → all per-cursor enables (low priority) ─────────
    {
      dots.cursors.bibataRainbow.enable  = lib.mkDefault cfg.enable;
      dots.cursors.bibata.enable         = lib.mkDefault cfg.enable;
      dots.cursors.bibataExtra.enable    = lib.mkDefault cfg.enable;
      dots.cursors.layan.enable          = lib.mkDefault cfg.enable;
      dots.cursors.capitaine.enable      = lib.mkDefault cfg.enable;
      dots.cursors.deepinWhite.enable    = lib.mkDefault cfg.enable;
      dots.cursors.deepinDark.enable     = lib.mkDefault cfg.enable;
      dots.cursors.sunset.enable         = lib.mkDefault cfg.enable;
      dots.cursors.plasmaOverdose.enable = lib.mkDefault cfg.enable;
      dots.cursors.hackneyed.enable      = lib.mkDefault cfg.enable;
      dots.cursors.xcursorPro.enable     = lib.mkDefault cfg.enable;
    }

    # ── Per-cursor install conditions ─────────────────────────────────────────
    (lib.mkIf (cfgBR.enable || cfg.pointerCursor == "bibataRainbow") {
      home.packages = [ bibataRainbow.packages.${cfgBR.variant} ];
    })

    (lib.mkIf (cfgB.enable || cfg.pointerCursor == "bibata") {
      home.packages = [ bibata.packages.${cfgB.variant} ];
    })

    (lib.mkIf (cfgBE.enable || cfg.pointerCursor == "bibataExtra") {
      home.packages = [ bibataExtra.packages.${cfgBE.variant} ];
    })

    (lib.mkIf (cfgL.enable || cfg.pointerCursor == "layan") {
      home.packages = [ layan.packages.${cfgL.variant} ];
    })

    (lib.mkIf (cfgC.enable || cfg.pointerCursor == "capitaine") {
      home.packages = [ capitaine.package ];
    })

    (lib.mkIf (cfgDW.enable || cfg.pointerCursor == "deepinWhite") {
      home.packages = [ deepin.white ];
    })

    (lib.mkIf (cfgDD.enable || cfg.pointerCursor == "deepinDark") {
      home.packages = [ deepin.dark ];
    })

    (lib.mkIf (cfgS.enable || cfg.pointerCursor == "sunset") {
      home.packages = [ sunset.package ];
    })

    (lib.mkIf (cfgPO.enable || cfg.pointerCursor == "plasmaOverdose") {
      home.packages = [ plasmaOverdose.package ];
    })

    (lib.mkIf (cfgH.enable || cfg.pointerCursor == "hackneyed") {
      home.packages = [ hackneyed.packages.${cfgH.variant} ];
    })

    (lib.mkIf (cfgXP.enable || cfg.pointerCursor == "xcursorPro") {
      home.packages = [ xcursorPro.packages.${cfgXP.variant} ];
    })

    # ── Set home.pointerCursor only when explicitly requested ─────────────────
    (lib.mkIf (cfg.pointerCursor != null) {
      home.pointerCursor = cursorRegistry.${cfg.pointerCursor}.pointerCursor;
    })

  ];
}
