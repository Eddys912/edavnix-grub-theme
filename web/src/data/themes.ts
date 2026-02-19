export interface ThemeConfig {
  name: string;
  suffix?: string;
  color: string;
  iconId: string;
}

export const themes: Record<string, ThemeConfig> = {
  alma: { name: 'Alma', suffix: 'Linux', color: '#0066d3', iconId: 'Alma' },
  alpine: { name: 'Alpine', suffix: 'Linux', color: '#0d597f', iconId: 'Alpine' },
  android: { name: 'Android', suffix: '', color: '#3ddc84', iconId: 'Android' },
  anonymous: { name: 'Anonymous', suffix: '', color: '#ffffff', iconId: 'Anonymous' },
  arch: { name: 'Arch', suffix: 'Linux', color: '#1793d1', iconId: 'Arch' },
  archcraft: { name: 'ArchCraft', suffix: '', color: '#97c27c', iconId: 'Archcraft' },
  arco: { name: 'Arco', suffix: 'Linux', color: '#648be4', iconId: 'Arco' },
  artix: { name: 'Artix', suffix: 'Linux', color: '#38b3d6', iconId: 'Artix' },
  centos: { name: 'Cent', suffix: 'OS', color: '#a14f8c', iconId: 'Centos' },
  debian: { name: 'Debian', suffix: '', color: '#a81d33', iconId: 'Debian' },
  deepin: { name: 'Deepin', suffix: '', color: '#007cff', iconId: 'Deepin' },
  devuan: { name: 'Devuan', suffix: '', color: '#004489', iconId: 'Devuan' },
  elementary: { name: 'Elementary', suffix: 'OS', color: '#64baff', iconId: 'Elementary' },
  endeavour: { name: 'Endeavour', suffix: 'OS', color: '#7f7fff', iconId: 'Endeavour' },
  fedora: { name: 'Fedora', suffix: '', color: '#51a2da', iconId: 'Fedora' },
  freebsd: { name: 'Free', suffix: 'BSD', color: '#ab2b28', iconId: 'Freebsd' },
  garuda: { name: 'Garuda', suffix: 'Linux', color: '#8839ef', iconId: 'Garuda' },
  gentoo: { name: 'Gentoo', suffix: 'Linux', color: '#54487a', iconId: 'Gentoo' },
  kali: { name: 'Kali', suffix: 'Linux', color: '#557C94', iconId: 'Kali' },
  kdeneon: { name: 'KDE', suffix: 'Neon', color: '#3dc08d', iconId: 'Kdeneon' },
  kubuntu: { name: 'Kubuntu', suffix: '', color: '#0079c1', iconId: 'Kubuntu' },
  linux: { name: 'Linux', suffix: '', color: '#fcc624', iconId: 'Linux' },
  lubuntu: { name: 'Lubuntu', suffix: '', color: '#0068c8', iconId: 'Lubuntu' },
  macos: { name: 'Mac', suffix: 'OS', color: '#ffffff', iconId: 'Macos' },
  manjaro: { name: 'Manjaro', suffix: 'Linux', color: '#35bfa4', iconId: 'Manjaro' },
  mint: { name: 'Linux', suffix: 'Mint', color: '#86be43', iconId: 'Mint' },
  mxlinux: { name: 'MX', suffix: 'Linux', color: '#ffffff', iconId: 'Mxlinux' },
  nixos: { name: 'Nix', suffix: 'OS', color: '#5277c3', iconId: 'Nixos' },
  nobara: { name: 'Nobara', suffix: 'Linux', color: '#5e50e6', iconId: 'Nobara' },
  opensuse: { name: 'open', suffix: 'SUSE', color: '#73ba25', iconId: 'Opensuse' },
  parrot: { name: 'Parrot', suffix: 'Security', color: '#15e0ed', iconId: 'Parrot' },
  popos: { name: 'Pop!_', suffix: 'OS', color: '#48b9C7', iconId: 'Popos' },
  proxmox: { name: 'Proxmox', suffix: '', color: '#e57000', iconId: 'Proxmox' },
  rocky: { name: 'Rocky', suffix: 'Linux', color: '#10b981', iconId: 'Rocky' },
  slackware: { name: 'Slackware', suffix: '', color: '#0000ff', iconId: 'Slackware' },
  solus: { name: 'Solus', suffix: '', color: '#5294e2', iconId: 'Solus' },
  steam: { name: 'Steam', suffix: 'OS', color: '#3a63c4', iconId: 'Steam' },
  tails: { name: 'Tails', suffix: 'OS', color: '#56347c', iconId: 'Tails' },
  ubuntu: { name: 'Ubuntu', suffix: '', color: '#e95420', iconId: 'Ubuntu' },
  ubuntumate: { name: 'Ubuntu', suffix: 'MATE', color: '#84a454', iconId: 'Ubuntumate' },
  void: { name: 'Void', suffix: 'Linux', color: '#478061', iconId: 'Void' },
  windows: { name: 'Windows', suffix: '', color: '#00a7e4', iconId: 'Windows' },
  xubuntu: { name: 'Xubuntu', suffix: '', color: '#0044aa', iconId: 'Xubuntu' },
  zorin: { name: 'Zorin', suffix: 'OS', color: '#15a6f0', iconId: 'Zorin' },
};

export type ThemeSlug = keyof typeof themes;
export const themeSlugs = Object.keys(themes) as ThemeSlug[];
