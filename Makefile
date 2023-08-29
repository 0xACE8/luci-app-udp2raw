#
# Copyright (C) 2016-2017 Jian Chang <aa65535@live.com>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for udp2raw-tunnel
LUCI_DESCRIPTION:=LuCI Support for udp2raw-tunnel.
LUCI_DEPENDS:=+udp2raw-tunnel
LUCI_PKGARCH:=all

PKG_NAME:=luci-app-udp2raw
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Jian Chang <aa65535@live.com>

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/postinst
#!/bin/sh
chmod 755 "$${IPKG_INSTROOT}/etc/init.d/udp2raw" >/dev/null 2>&1
ln -sf "../init.d/udp2raw" \
	"$${IPKG_INSTROOT}/etc/rc.d/S88udp2raw" >/dev/null 2>&1
exit 0
endef

# call BuildPackage - OpenWrt buildroot signature
