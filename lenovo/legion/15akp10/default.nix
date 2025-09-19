{
  config,
  pkgs,
  ...
}:
{
  services.xserver.videoDrivers = ["amdgpu" "nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = true;

    # To use open drivers (as recommended by Nvidia) on latest kernel (ATOW: 6.16.7), the nvidia driver version must be locked to (at time of writing) 580.65.06 (latest beta).
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "580.65.06";
      sha256_64bit = "sha256-BLEIZ69YXnZc+/3POe1fS9ESN1vrqwFy6qGHxqpQJP8=";
      sha256_aarch64 = "sha256-4CrNwNINSlQapQJr/dsbm0/GvGSuOwT/nLnIknAM+cQ=";
      openSha256 = "sha256-BKe6LQ1ZSrHUOSoV6UCksUE0+TIa0WcCHZv4lagfIgA=";
      settingsSha256 = "sha256-9PWmj9qG/Ms8Ol5vLQD3Dlhuw4iaFtVHNC0hSyMCU24=";
      persistencedSha256 = "sha256-ETRfj2/kPbKYX1NzE0dGr/ulMuzbICIpceXdCRDkAxA=";
    };
/*
    # Alternatively go with:
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
*/
    prime = {
      offload.enable = true;
      amdgpuBusId = "PCI:101@0:0:0";
      nvidiaBusId = "PCI:0:99:0";
    };
  };
}
