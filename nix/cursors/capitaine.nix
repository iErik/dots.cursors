# Capitaine cursors — keeferrourke/capitaine-cursors
# Uses pkgs.capitaine-cursors from nixpkgs (nixos-unstable).
# Both dark and white are installed by a single derivation.
# Variants: dark → "capitaine-cursors", white → "capitaine-cursors-white"
pkgs: lib:
{
  package = pkgs.capitaine-cursors;
  names = {
    dark  = "capitaine-cursors";
    white = "capitaine-cursors-white";
  };
}
