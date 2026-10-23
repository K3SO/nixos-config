{ pkgs, ... }:

{
    fonts = {
        fontconfig = {
            enable = true;

            defaultFonts = {
                monospace = [
                    "MapleMono NF"
                    "JetBrainsMono Nerd Font"
                ];
                sansSerif = [ "Rubik" ];
                serif = [ ];
                emoji = [ ];
            };
        };

        packages = with pkgs; [
            maple-mono.NF
            nerd-fonts.jetbrains-mono
            rubik
        ];
    };
}