{ pkgs, ... }:

{
    services.displayManager.ly.enable = true;
    
    programs.steam.enable = true;
    
    programs.obs-studio.enable = true;

    environment.systemPackages = with pkgs; [
        vim
        neovim
        vscodium
        wget
        curl
        kitty
        awww
        git
        brave-origin
	    gh
        obsidian
        discord
    ];
}