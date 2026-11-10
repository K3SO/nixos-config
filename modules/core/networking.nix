{ host, ... }:

{
    networking = {

        hostName = "${host}";
        
        networkmanager = {
            enable = true;
            # iwd should work better than wpa, but for some reason it doesn't.
            # I'll try to configure it someday.
            # wifi.backend = "iwd";
        };

        nameservers = [
            "1.0.0.1"
            "1.1.1.1"
            "8.8.8.8"
        ];

        firewall = {
            enable = true;
            # allowedTCPPorts = [  ];
        };
        
    };

    services.cloudflare-warp.enable = true;
}