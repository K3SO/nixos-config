{ pkgs, ... }:

{   
    programs.steam.enable = true;
    
    programs.obs-studio.enable = true;

    environment.systemPackages = with pkgs; [

        # Text editors
        vim
        neovim
        vscodium

        # Utility
        wget
        curl
        
        # Version control
        git
	    gh

        # Misc
        obsidian        # Note app
        discord
        brave-origin    # Browser

    ];
}