{ swapsize, ... }:

{
    swapDevices = [{
        device = "/var/lib/swapfile";
        size = swapsize*1024;
    }];
}