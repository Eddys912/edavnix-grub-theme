<div align="center">
  <h1>Edavnix GRUB Theme</h1>
  <p>Minimalist <strong>GRUB theme</strong> with multiple variants</p>

![GRUB](https://img.shields.io/badge/GRUB-A42E2B?logo=gnu&logoColor=A42E2B&labelColor=fff&color=A42E2B)
![Ventoy](https://img.shields.io/badge/Ventoy-0040a0?logo=ventoy&logoColor=0040a0&labelColor=fff&color=0040a0)

</div>

## Description

A minimalist and modern GRUB theme with multiple variants, compatible with both system bootloaders and Ventoy USB drives. The theme includes:

- **Backgrounds**: Multiple theme variants available in `themes/`.
- **Icons**: 64x64 pixel distro icons with fallback support.
- **Menu**: Centered boot menu with smooth selectors.
- **Resolution**: Optimized for 1920x1080.
- **Typography**: Space Mono Regular.

## Installation

### Quick Install (Recommended)

Install directly without cloning the repository using `curl`:

```bash
curl -fsSL https://edavnix.dev/install.sh | sudo bash
```

The installer will guide you through:

- **Theme selection**: Choose your preferred background variant.
- **Install target**: System GRUB or Ventoy USB drive.
- **Install path**: Automatically detected or manually specified.

### Script Install

Download and run the installer manually if you prefer to inspect it before executing:

```bash
curl -fsSL https://edavnix.dev/install.sh -o install.sh
chmod +x install.sh
sudo ./install.sh
```

### Manual Installation

#### For System GRUB (Linux)

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Eddys912/edavnix-grub-theme.git
   cd edavnix-grub-theme
   ```
2. **Copy theme files**:
   ```bash
   sudo cp -r edavnix /boot/grub/themes/
   ```
3. **Copy your preferred background**:
   ```bash
   sudo cp themes/arch.png /boot/grub/themes/edavnix/background.png
   ```
4. **Edit GRUB configuration**:
   ```bash
   sudo nano /etc/default/grub
   ```
5. **Add or modify these lines**:
   ```bash
   GRUB_THEME="/boot/grub/themes/edavnix/theme.txt"
   GRUB_GFXMODE=1920x1080
   ```
6. **Update GRUB**:
   ```bash
   sudo update-grub                               # Debian / Ubuntu / Mint
   sudo grub-mkconfig -o /boot/grub/grub.cfg      # Arch / Manjaro
   sudo grub2-mkconfig -o /boot/grub2/grub.cfg    # Fedora / RHEL
   ```

#### For Ventoy USB

1. **Install Ventoy** on your USB drive from [ventoy.net](https://www.ventoy.net/).
2. **Clone the repository**:
   ```bash
   git clone https://github.com/Eddys912/edavnix-grub-theme.git
   cd edavnix-grub-theme
   ```
3. **Copy theme to USB**:
   ```bash
   cp -r edavnix /path/to/usb/ventoy/themes/
   cp themes/arch.png /path/to/usb/ventoy/themes/edavnix/background.png
   cp ventoy/ventoy.json /path/to/usb/ventoy/
   ```
4. **Verify `ventoy.json`** contains:
   ```json
   {
     "theme": {
       "enabled": true,
       "file": "/ventoy/themes/edavnix/theme.txt",
       "gfxmode": "1920x1080",
       "display_mode": "GUI",
       "ventoy_left": "5%",
       "ventoy_top": "95%",
       "ventoy_color": "#1793d1"
     }
   }
   ```

## Theme Variants

| Preview                  | Name                |
| ------------------------ | ------------------- |
| ![arch](themes/arch.png) | Arch Blue (Default) |

> Additional previews available at [edavnix.dev](https://edavnix.dev).

## Ventoy Configuration

Edit `/ventoy/ventoy.json` on your USB to customize how ISOs appear in the boot menu:

```json
{
  "theme": {
    "enabled": true,
    "file": "/ventoy/themes/edavnix/theme.txt"
  },
  "control": [{ "VTOY_DEFAULT_SEARCH_ROOT": "/" }, { "VTOY_MENU_TIMEOUT": "15" }, { "VTOY_DEFAULT_IMAGE": "/archlinux.iso" }],
  "menu_alias": [
    {
      "image": "/archlinux.iso",
      "alias": "Arch Linux"
    }
  ],
  "menu_class": [
    {
      "key": "archlinux",
      "class": "arch"
    }
  ]
}
```

**Configuration breakdown:**

- `menu_alias`: Custom display names for your ISOs.
- `menu_class`: Maps ISO filename keywords to icon classes.
- Icons are matched by class name (e.g., class `arch` uses `arch.png`).
- All icons must be placed in `/ventoy/themes/edavnix/icons/`.

**Supported icon classes:**
`alma`, `alpine`, `android`, `arch`, `archcraft`, `arco`, `artix`, `centos`, `debian`, `deepin`, `devuan`, `elementary`, `endeavour`, `fedora`, `freebsd`, `garuda`, `gentoo`, `kali`, `kdeneon`, `kubuntu`, `linux`, `lubuntu`, `macos`, `manjaro`, `mint`, `mxlinux`, `nixos`, `nobara`, `opensuse`, `parrot`, `popos`, `proxmox`, `rocky`, `slackware`, `solus`, `steam`, `tails`, `ubuntu`, `ubuntumate`, `void`, `windows`, `xubuntu`, `zorin`

## License

This project is licensed under the **GNU General Public License v3.0** (GPL-3.0).
This means you are free to use, modify, and distribute this software, but any derivative works must also be open-source and released under the same license. You must also include the original copyright notice. See the [`LICENSE`](LICENSE) file for more details.

## Official Documentation

Additional resources:

- **[GNU GRUB Manual](https://www.gnu.org/software/grub/manual/grub/grub.html)**
- **[GRUB Theme Format](https://www.gnu.org/software/grub/manual/grub/html_node/Theme-file-format.html)**
- **[Ventoy Official Site](https://www.ventoy.net/)**
- **[Ventoy Theme Guide](https://www.ventoy.net/en/plugin_theme.html)**
- **[Ventoy JSON Configuration](https://www.ventoy.net/en/plugin_control.html)**

<div align="center">
  <br>
  <img
    src="https://img.shields.io/badge/Made%20with-GRUB%20%26%20Ventoy-A42E2B?style=for-the-badge"
    alt="Made with GRUB & Ventoy"
  />
  <br><br>
  <p>⭐ <strong>Star this repository to show support</strong> ⭐</p>
</div>
