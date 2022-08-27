{ lib, config, pkgs, ... }:
{
  services.xserver.extraConfig = ''
    
    # nvidia-settings: X configuration file generated by nvidia-settings
    # nvidia-settings:  version 515.65.01
    
    Section "ServerLayout"
        Identifier     "Layout0"
        Screen      0  "Screen0" 0 0
        InputDevice    "Keyboard0" "CoreKeyboard"
        InputDevice    "Mouse0" "CorePointer"
        Option         "Xinerama" "0"
    EndSection
    
    Section "Files"
    EndSection
    
    Section "InputDevice"
        # generated from default
        Identifier     "Mouse0"
        Driver         "mouse"
        Option         "Protocol" "auto"
        Option         "Device" "/dev/input/mice"
        Option         "Emulate3Buttons" "no"
        Option         "ZAxisMapping" "4 5"
    EndSection
    
    Section "InputDevice"
        # generated from default
        Identifier     "Keyboard0"
        Driver         "kbd"
    EndSection
    
    Section "Monitor"
        # HorizSync source: edid, VertRefresh source: edid
        Identifier     "Monitor0"
        VendorName     "Unknown"
        ModelName      "ViewSonic VA2231 Series"
        HorizSync       24.0 - 82.0
        VertRefresh     50.0 - 75.0
        Option         "DPMS"
    EndSection
    
    Section "Device"
        Identifier     "Device0"
        Driver         "nvidia"
        VendorName     "NVIDIA Corporation"
        BoardName      "NVIDIA GeForce GTX 1080 Ti"
    EndSection
    
    Section "Screen"
        Identifier     "Screen0"
        Device         "Device0"
        Monitor        "Monitor0"
        DefaultDepth    24
        Option         "Stereo" "0"
        Option         "nvidiaXineramaInfoOrder" "DFP-6"
        Option         "metamodes" "HDMI-0: nvidia-auto-select +0+0, DP-4: 1920x1080_240 +1920+0"
        Option         "SLI" "Off"
        Option         "MultiGPU" "Off"
        Option         "BaseMosaic" "off"
        SubSection     "Display"
            Depth       24
        EndSubSection
    EndSection
  
  ''; 
}