{ pkgs, ... }:

{
    services.displayManager.ly.enable = true;
    
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        
        # This fix the graphical-session.target not starting problem,
        # not the ideal solution, adds an extra layer, but works.
        # It also has some nice advantages tho.
        # Maybe consider niri??
        withUWSM = true;
    };

    environment.systemPackages = with pkgs; [
        kitty           # Terminal emulator
        awww            # Wallpaper (awww-daemon)
        quickshell      # Shell
    ];
}