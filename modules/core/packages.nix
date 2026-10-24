{ pkgs, lib, config, ... }:

{   
    options = {
        texteditors.enable = lib.mkEnableOption "Enables optional text editors";
        gaming.enable = lib.mkEnableOption "Enables gaming related programs";
        video.enable = lib.mkEnableOption "Enables video related programs";
        productivity.enable = lib.mkEnableOption "Enables productivity related programs";
    };

    config = {

        # Gaming
        programs.steam.enable = lib.mkIf config.gaming.enable true;

        # Video
        programs.obs-studio.enable = lib.mkIf config.video.enable true;

        # Packages
        environment.systemPackages =

            # Text Editors
            (lib.optionals config.texteditors.enable [
                pkgs.vscodium
                pkgs.neovim
            ])++

            # Gaming
            (lib.optionals config.gaming.enable [
                pkgs.discord
            ])++

            # Video
            (lib.optionals config.video.enable [
                pkgs.mpv                 # Multimedia player (the best you can find (a lot better than vlc))
                pkgs.davinci-resolve     # Video and photo editor
            ])++

            # Productivity
            (lib.optionals config.productivity.enable [
                pkgs.obsidian           # Note app
            ])++

            # Misc / essential
            (with pkgs; [

                # Text editors
                vim

                # Utility
                wget
                curl
                
                # Version control
                git
                gh

                # Misc
                brave-origin        # Browser
                godot

            ]);

    };
}