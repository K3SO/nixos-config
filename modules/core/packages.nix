{ pkgs, ... }:

{   
    programs.steam.enable = true;
    
    programs.obs-studio.enable = true;

    environment.systemPackages = with pkgs; [
        vim
        neovim
        vscodium
        wget
        curl
        git
        brave-origin
	    gh
        obsidian
        discord
    ];
}