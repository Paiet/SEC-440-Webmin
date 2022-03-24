#!/bin/sh

set -e

aur_install()
{
  git clone https://aur.archlinux.org/"${1}".git
  cd "${1}"
  makepkg -s --noconfirm
  sudo pacman -U --noconfirm ./*.pkg.tar.xz
  cd ..
}

webmin_main()
{
  sudo pacman -Sy --noconfirm git base-devel
  aur_install perl-authen-pam
  aur_install perl-encode-detect
  aur_install webmin
  sudo systemctl enable webmin
  sudo systemctl restart webmin
}

webmin_main
