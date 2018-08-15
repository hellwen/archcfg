
```
pacman -S acpid
systemctl start acpid
systemctl enable acpid
rm -rf /etc/acpi
ln -s ~/.archcfg/acpi /etc/acpi
```
