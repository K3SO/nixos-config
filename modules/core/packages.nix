{ pkgs, lib, config, ... }:

{   
    options = {
        texteditors.enable = lib.mkEnableOption "Enables optional text editors";
        gaming.enable = lib.mkEnableOption "Enables gaming related programs";
        video.enable = lib.mkEnableOption "Enables video related programs";
        music.enable = lib.mkEnableOption "Enables music related programs";
        gamedev.enable = lib.mkEnableOption "Enables gamedev related programs";
        desktop.enable = lib.mkEnableOption "Enables basic desktop programs";
        productivity.enable = lib.mkEnableOption "Enables productivity related programs";
    };

    config = {

        # Gaming
        programs.steam.enable = lib.mkIf config.gaming.enable true;

        # Video
        programs.obs-studio.enable = lib.mkIf config.video.enable true;

        # No option
        programs.fish = {
            enable = true;
            shellAbbrs = {
                gs = "git status";
                gc = ''git commit -m ""'';
            };
        };

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
                pkgs.prismlauncher      # Minecraft launcher
                pkgs.gamescope
            ])++

            # Video
            (lib.optionals config.video.enable [
                pkgs.mpv                # Multimedia player (the best you can find (a lot better than vlc))
                pkgs.davinci-resolve    # Video and photo editor
            ])++

            # Music
            (lib.optionals config.music.enable [
                pkgs.qjackctl           # Jack server
                pkgs.tone3000           # Guitar/bass amp (really cool)
            ])++

            # Gamedev
            (lib.optionals config.gamedev.enable [
                pkgs.godot              # Game engine
                pkgs.blender            # 3D modeling software
                pkgs.aseprite           # Pixel art editor
                pkgs.gimp               # Image editor
            ])++

            # Desktop
            (lib.optionals config.desktop.enable [
                pkgs.brave-origin       # Browser
                pkgs.yazi               # Terminal file manager
                pkgs.brightnessctl
            ])++

            # Productivity
            (lib.optionals config.productivity.enable [
                pkgs.obsidian           # Note app
            ])++

            # No option
            (with pkgs; [

                # Text editors
                vim

                # Utility
                wget
                curl
                unzip
                
                # Version control
                git
                gh

                # Misc

            ]);

    };
}