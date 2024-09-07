# ALIS - RiftOS

Fork of the [Ariser](https://ariser.eu/) project [ALIS](https://github.com/ariser-installer/alis) based on [picodotdev's ALIS](https://github.com/picodotdev/alis).

This repository contains the ALIS (Arch Linux Install Script) that is part of [RiftOS](https://github.com/svartm/rift). RiftOS is a personal project based on [Ariser](https://ariser.eu/), a configurable automatic terminal install method for ArchLinux.


## ALIS

[Arch Linux Install Script](https://github.com/picodotdev/alis) (or alis, also known as _the Arch Linux executable installation guide and wiki_) installs an unattended, automated and customized Arch Linux system.

ALIS is a simple Bash script developed from many Arch Linux Wiki pages that fully automates the installation of an [Arch Linux](https://archlinux.org/) system after booting from the original Arch Linux installation media.

It contains the same commands that you would type and execute one by one interactively to complete the installation. The only user intervention needed is to edit a configuration file to choose the installation options and preferences from partitioning, to encryption, bootloader, file system, language and keyboard mapping, desktop environment, kernels, packages to install and graphic drivers. This automation makes the installation easy and fast, as fast as your internet connection allows.

If some time later after a system update, for any reason the system does not boot correctly, a recovery script is also provided to enter into a recovery mode that allows you to downgrade packages or execute any other commands to restore the system. Also, a log of the installation can be taken with <a href="https://asciinema.org/">asciinema</a>.

A simple powerful Bash based script for an unattended, easy and fast way to install Arch Linux.<br>
Boot. Get. Configure. Install. Enjoy.

**Warning! This script can delete all partitions of the persistent storage. It is recommended to test it first in a virtual machine like <a href="https://www.virtualbox.org/">VirtualBox</a>.**

Currently these scripts are for me, but maybe they are useful for you too.

Follow the [Arch Way](https://wiki.archlinux.org/title/Arch_Linux) of doing things and learn what this script does. This will allow you to know what is happening.

Please, don't ask for support for this script in Arch Linux forums, first read the [Arch Linux wiki](https://wiki.archlinux.org), the [Installation Guide](https://wiki.archlinux.org/title/Installation_guide) and the [General Recommendations](https://wiki.archlinux.org/title/General_recommendations), later compare those commands with the commands of this script.

For new features, improvements and bugs, fill an issue in GitHub or make a pull request. You can test it in a virtual machine (strongly recommended) like [VirtualBox](https://www.virtualbox.org/) before you run it in real hardware.

**Arch Linux Install Script (alis) is based on Arch Linux but is NOT approved, sponsored, or affiliated with Arch Linux or its related projects.**

[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux.svg "Arch Linux")](https://www.archlinux.org/)


## Principles

* Meant to be used as part of [RiftOS](https://github.com/svartm/rift) ISO. Can be cloned into original Arch Linux installation media.
* As unattended and automated as possible, requires as little interactivity as possible.
* Allow to customize the installation to cover the most common cases.
* Provide support for system recovery.
* Provide support for installation log.
* Pre-configured with my own configuration. May not be optimal for other users or use cases.

## Features

* **System**: UEFI, BIOS (If bootloader is set to something other than auto, the installer may expect EFI.)
* **Storage**: SATA, NVMe and MMC
* **Encryption**: root partition encrypted and no encrypted
* **Partition**: no LVM, LVM, LVM on LUKS, GPT on UEFI, MBR on BIOS, custom partition scheme and mountpoints
* **File system**: ext4, btrfs (with subvols), xfs, f2fs, reiserfs
* **Kernels**: linux, linux-lts, linux-hardened, linux-zen. Supports Unified Kernel Image (UKI).
* **Desktop environment**: GNOME, KDE, XFCE, Mate, Cinnamon, LXDE, i3-wm, i3-gaps, Deepin, Budgie, Bspwm, Awesome, Qtile, Openbox, Leftwm, Dusk
* **Display managers**: GDM, SDDM, Lightdm, lxdm
* **Graphics controller**: intel, nvidia and amd with optionally early KMS start. With intel optionally fastboot, hardware video acceleration and framebuffer compression.
* **Bootloader**: GRUB, rEFInd, systemd-boot, efistub
* **Custom shell**: bash, zsh, dash, fish
* **WPA WIFI network** installation
* **Periodic TRIM** for SSD storage
* Intel and AMD **processors microcode**
* Optional **swap file**
* **PipeWire** support
* **Secure Boot** support
* **Kernel compression** and **custom parameters**
* **Users creation** and **add to sudoers**
* **systemd units enable or disable**
* **systemd-homed** support
* **systemd GPT partition automounting** support
* **Multilib** support
* **Files provision** support
* **VirtualBox guest additions** and **VMware tools** support
* **SSH install** and **cloud-init** support
* Arch Linux custom **packages installation** and **repositories installation**
* Flatpak utility installation and **Flatpak packages installation**
* SDKMAN utility installation and **SDKMAN packages installation**
* **AUR utility** installation (paru, yay, aurman) and **AUR packages installation**
* **Packages installation after base system installation** (preferred way of packages installation)
* Script for download installation and **recovery scripts** and configuration files
* **Retry packages download** on connection/mirror error
* **Packer support** for testing in VirtualBox
* **Installation log** with all commands executed and output in a file and/or **asciinema video**
* Wait after installation for an **abortable reboot**
* **Use your own configuration**. Files provisioned from `/files` including an `/etc/skel` directory for user configuration files.
 * Bash scripts validated by [Shellcheck](https://www.shellcheck.net/)

## System installation TODO

Build an ISO from the [Rift](https://github.com/svartm/rift) repository. (Optionally, download and boot from the latest <a href="https://www.archlinux.org/download/">original Arch Linux installation media</a>, then git clone this repository. After boot use the following commands to start the installation.

Follow the <a href="https://wiki.archlinux.org/title/Arch_Linux">Arch Way</a> of doing things and learn what this script does. This will allow you to know what is happening.

Internet connection is required, with wireless WIFI connection see <a href="https://wiki.archlinux.org/title/Wireless_network_configuration#Wi-Fi_Protected_Access">Wireless_network_configuration</a> to bring up WIFI connection before start the installation.

**Minimum usage**

```
#                         # Start the system with latest Arch Linux installation media
# loadkeys [keymap]       # Load keyboard keymap, eg. loadkeys es, loadkeys us, loadkeys de
# vim /alis/alis.conf     # Edit configuration and change variables values with your preferences (system configuration)
# alis                    # Start installation
#                         # Note that if you made any changes, pulling the newest files from github will overwrite them.
```

**Advanced usage**

```
#                         # Start the system with latest Arch Linux installation media
# loadkeys [keymap]       # Load keyboard keymap, eg. loadkeys es, loadkeys us, loadkeys de
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"          # (Optional) Connect to WIFI network. _ip link show_ to know WIFI_INTERFACE.
# alis                    # Pull the newest changes (y) but don't run the script yet (n) if you wish to make changes to the configuration.
# cd /alis                # Navigate to the alis directory
# ./alis-asciinema.sh     # (Optional) Start asciinema video recording
# vim alis.conf           # Edit configuration and change variables values with your preferences (system configuration)
# vim alis-packages.conf  # (Optional) Edit configuration and change variables values with your preferences (packages to install)
#                         # (The preferred way to install packages is after system installation, see Packages installation)
# alis                    # Start installation. Don't pull the repository from github if you want to keep your modifications.
# ./alis-reboot.sh        # (Optional) Reboot the system, only necessary when REBOOT="false"
```


## Package installation

After the base Arch Linux system is installed, alis can install packages with pacman, Flatpak, SDKMAN and from AUR.
It's recommended to install packages after the base installation and reboot, but if the `PACKAGES_INSTALL="true"` option is set in `alis.conf`, packages outlined in `alis-packages.conf` will be already installed during the installation process.

```
#                                  # After system installation start a user session
# git clone https://github.com/svartm/alis-rift.git    # clone this repository
# cd alis-rift
# ./alis-packages-asciinema.sh     # (Optional) Start asciinema video recording
# vim alis-packages.conf           # Edit configuration and change variables values with your preferences (packages to install)
# ./alis-packages.sh               # Start packages installation
```

## Recovery

Boot from the latest <a href="https://www.archlinux.org/download/">original Arch Linux installation media</a>. After boot use the following commands to start the recovery, this will allow you to enter in the arch-chroot environment.

```
#                                  # Start the system with latest Arch Linux installation media
# loadkeys [keymap]                # Load keyboard keymap, eg. loadkeys es, loadkeys us, loadkeys de
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"          # (Optional) Connect to WIFI network. _ip link show_ to know WIFI_INTERFACE.
# curl -sL https://raw.githubusercontent.com/picodotdev/alis/master/download.sh | bash     # Download alis scripts
# # curl -sL https://git.io/JeaH6 | bash                                                   # Alternative download URL with URL shortener
# ./alis-recovery-asciinema.sh     # (Optional) Start asciinema video recording
# vim alis-recovery.conf           # Edit configuration and change variables values with your last installation configuration with alis (mainly device and partition scheme)
# ./alis-recovery.sh               # Start recovery
# ./alis-recovery-reboot.sh        # Reboot the system
```

## SSH install and cloud-init

SSH install and cloud-init allows to install Arch Linux unattended and automated way in local virtual machines and cloud environments.

Build the cloud-init ISO, mount it in the VM along side the official Arch Linux installation media, start the VM and get its IP address.

```
$ ./alis-cloud-init-iso.sh
```

SSH to the VM.

```
$ ./alis-cloud-init-ssh.sh -i "${IP_ADDRESS}"
```

Or, start a unattended installation with the provided configuration.

```
$ ./alis-cloud-init-ssh.sh -i "${IP_ADDRESS}" -c "alis-config-efi-ext4-systemd.sh"
```

## Screenshots

Once the installation ends, you will have a ready to use system with your choosen preferences including all the free software latest version you wish to do produtive task from browsing, multimedia and office programs, to programming languages, compilers and server software and tools for creative and artistic tasks.

These are some desktop environments that can be installed.

[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-gnome-thumb.jpg "Arch Linux with GNOME")](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-gnome.jpg)
[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-kde-thumb.jpg "Arch Linux with KDE")](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-kde.jpg)
[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-xfce-thumb.jpg "Arch Linux with XFCE")](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-xfce.jpg)
[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-cinnamon-thumb.jpg "Arch Linux with Cinnamon")](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-cinnamon.jpg)
[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-mate-thumb.jpg "Arch Linux with Mate")](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-mate.jpg)
[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-lxde-thumb.jpg "Arch Linux with LXDE")](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-lxde.jpg)
[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-root-password-thumb.png "Arch Linux unloking LUKS on boot")](https://raw.githubusercontent.com/picodotdev/alis/master/images/archlinux-root-password.png)

## Video

Arch Linux base installation installed in less than 4 minutes with a fiber internet connection and a NVMe SSD. Don't trust me? See the video.

Type the system installation commands and wait to the installation complete. After a reboot the system is ready to use and customized with your choosen preferences.

[![asciicast](https://asciinema.org/a/444025.png)](https://asciinema.org/a/444025)

## How you can help

* Test in VirtualBox and create an issue if something does not work, attach the main parts of the used configuration file and the error message
* Create issues with new features
* Send pull requests
* Share it in social networks, forums, create a blog post or video about it
* Send me an email, I like to read that the script is being used and is useful :). Which are your computer specs, which is your alis configuration, if is your personal or working computer, if all worked fine or some suggestion to improve the script

## Media reference

* 2022.01 [Arch + Alis, Arco Linux](https://www.arcolinuxiso.com/aa/) ([video playlist](https://www.youtube.com/playlist?list=PLlloYVGq5pS7lMblPjiifVxxnMAqYzBU5))
* 2020.07 [Arch installer - alis](https://r1ce.net/2020/07/07/arch-installer-alis/)
* 2019.06 [Arch Linux OS Challenge: Install Arch 'The Easy Way' With These 2 Alternative Methods](https://www.forbes.com/sites/jasonevangelho/2019/06/10/arch-linux-os-challenge-2-alternatives-install-gui-script-easy/)

## Alternatives

There are other quite good similar projects that can be used as alternative to install a vanilla Arch Linux without any additions.

* [Arch Installer](https://github.com/archlinux/archinstall) (archinstall) (maybe is the most relevant as is included in the official installation media)
* [archfi](https://github.com/MatMoul/archfi/)
* [Archlinux Ultimate Installer (aui)](https://github.com/helmuthdu/aui) (only accepts patches)

Also, if you prefer to install an Arch Linux using a guided graphical installer you can choose an [Arch based distribution](https://wiki.archlinux.org/title/Arch-based_distributions#Active). 

* [ArcoLinux](https://arcolinux.com/)
* [Manjaro](https://manjaro.org/)
* [EndeavourOS](https://endeavouros.com/)
* [GarudaLinux](https://garudalinux.org/)
* [Archlabs](https://archlabslinux.com/)
* [RebornOS](https://rebornos.org/)
* [BlackArch](https://blackarch.org/)

Also and recommended for new Arch Linux newcomers to follow the Arch Way of doing things is a good way to use and learn about Arch. There are many guides out there, the official Arch Linux installation guide the first one. These are other good ones that explains step by step from instalation media creation to first boot and programs installation, all the necessary to start.

* [The Arch Linux Handbook](https://www.freecodecamp.org/news/how-to-install-arch-linux/)

## Test in VirtualBox with Packer

VirtualBox and [Packer](https://packer.io/) are required.

* Firmware: efi, bios
* File system: ext4, btrfs, f2fs, xfs
* Partition: luks, lvm
* Bootloader: grub, refind, systemd
* Desktop environment: gnome, kde, xfce, ...

```
$ ./alis-packer.sh -c alis-packer-efi-ext4-systemd.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-systemd-gnome.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-luks-lvm-grub.sh
$ ./alis-packer.sh -c alis-packer-efi-btrfs-luks-lvm-systemd.sh
$ ./alis-packer.sh -c alis-packer-efi-f2fs-luks-lvm-systemd.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-grub-gnome.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-grub-kde.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-grub-xfce.sh
```

## Arch Linux Installation Media

https://www.archlinux.org/download/

## Reference

* https://archlinux.org/pacman/pacman.conf.5.html#_repository_sections
* https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/configs/releng/packages.x86_64
* https://tldp.org/LDP/abs/html/
* https://tldp.org/LDP/Bash-Beginners-Guide/html/
* https://wiki.archlinux.org/title/AMDGPU
* https://wiki.archlinux.org/title/Arch_User_Repository
* https://wiki.archlinux.org/title/ATI
* https://wiki.archlinux.org/title/Awesome
* https://wiki.archlinux.org/title/Bluetooth
* https://wiki.archlinux.org/title/Bspwm
* https://wiki.archlinux.org/title/Btrfs
* https://wiki.archlinux.org/title/Budgie
* https://wiki.archlinux.org/title/Category:Boot_loaders
* https://wiki.archlinux.org/title/Cloud-init
* https://wiki.archlinux.org/title/Command-line_shell
* https://wiki.archlinux.org/title/Deepin_Desktop_Environment
* https://wiki.archlinux.org/title/Desktop_environment
* https://wiki.archlinux.org/title/Dm-crypt
* https://wiki.archlinux.org/title/Dm-crypt/Device_encryption
* https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system
* https://github.com/bakkeby/dusk
* https://wiki.archlinux.org/title/EFI_System_Partition
* https://wiki.archlinux.org/title/Ext4
* https://wiki.archlinux.org/title/F2FS
* https://wiki.archlinux.org/title/File_systems
* https://wiki.archlinux.org/title/Fstab
* https://wiki.archlinux.org/title/General_recommendations
* https://wiki.archlinux.org/title/GNOME
* https://wiki.archlinux.org/title/GRUB
* https://wiki.archlinux.org/title/Hardware_video_acceleration
* https://wiki.archlinux.org/title/I3
* https://wiki.archlinux.org/title/Install_Arch_Linux_via_SSH
* https://wiki.archlinux.org/title/Installation_guide
* https://wiki.archlinux.org/title/Intel_graphics
* https://wiki.archlinux.org/title/Intel_NUC
* https://wiki.archlinux.org/title/KDE
* https://wiki.archlinux.org/title/Kernel_mode_setting
* https://wiki.archlinux.org/title/Kernel_parameters
* https://wiki.archlinux.org/title/Kernels
* https://wiki.archlinux.org/title/LeftWM
* https://wiki.archlinux.org/title/List_of_applications
* https://wiki.archlinux.org/title/LVM
* https://wiki.archlinux.org/title/Main_page
* https://wiki.archlinux.org/title/Microcode
* https://wiki.archlinux.org/title/Mirrors
* https://wiki.archlinux.org/title/Mkinitcpio
* https://wiki.archlinux.org/title/Network_configuration
* https://wiki.archlinux.org/title/NetworkManager
* https://wiki.archlinux.org/title/Nouveau
* https://wiki.archlinux.org/title/NVIDIA
* https://wiki.archlinux.org/title/Openbox
* https://wiki.archlinux.org/title/Pacman
* https://wiki.archlinux.org/title/Partitioning
* https://wiki.archlinux.org/title/Persistent_block_device_naming
* https://wiki.archlinux.org/title/PipeWire
* https://wiki.archlinux.org/title/Qtile
* https://wiki.archlinux.org/title/REFInd
* https://wiki.archlinux.org/title/Reflector
* https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot
* https://wiki.archlinux.org/title/Solid_state_drive/NVMe
* https://wiki.archlinux.org/title/Solid_State_Drives
* https://wiki.archlinux.org/title/Swap
* https://wiki.archlinux.org/title/Systemd
* https://wiki.archlinux.org/title/Systemd#GPT_partition_automounting
* https://wiki.archlinux.org/title/Systemd-boot
* https://wiki.archlinux.org/title/Systemd-homed
* https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface
* https://wiki.archlinux.org/title/VirtualBox
* https://wiki.archlinux.org/title/Wayland
* https://wiki.archlinux.org/title/Wireless_network_configuration
* https://wiki.archlinux.org/title/Wireless_network_configuration#Connect_to_an_access_point
* https://wiki.archlinux.org/title/Xfce
* https://wiki.archlinux.org/title/XFS
* https://wiki.archlinux.org/title/Xorg

