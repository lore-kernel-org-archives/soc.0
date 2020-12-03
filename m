Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4362BC4361A
	for <soc@archiver.kernel.org>; Thu,  3 Dec 2020 23:19:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F289F22483; Thu,  3 Dec 2020 23:19:40 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andre Edich <andre.edich@microchip.com>,
	YueHaibing <yuehaibing@huawei.com>,
	Hayes Wang <hayeswang@realtek.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: usb: select CONFIG_CRC32 where needed
Date: Fri,  4 Dec 2020 00:19:26 +0100
Message-Id: <20201203231936.1485132-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Without CRC32, these fail to link:

arm-linux-gnueabi-ld: drivers/net/usb/r8152.o: in function `_rtl8152_set_rx_mode':
r8152.c:(.text+0x2fd68): undefined reference to `crc32_le'
arm-linux-gnueabi-ld: drivers/net/usb/lan78xx.o: in function `lan78xx_set_multicast':
lan78xx.c:(.text+0x7cf4): undefined reference to `crc32_le'
arm-linux-gnueabi-ld: drivers/net/usb/cdc_eem.o: in function `eem_rx_fixup':
cdc_eem.c:(.text+0x374): undefined reference to `crc32_le'
arm-linux-gnueabi-ld: drivers/net/usb/cdc_eem.o: in function `eem_tx_fixup':
cdc_eem.c:(.text+0x70c): undefined reference to `crc32_le'
arm-linux-gnueabi-ld: drivers/net/usb/mcs7830.o: in function `mcs7830_data_set_multicast':

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/usb/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 1e3719028780..dcc80fca921c 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -99,6 +99,7 @@ config USB_RTL8150
 config USB_RTL8152
 	tristate "Realtek RTL8152/RTL8153 Based USB Ethernet Adapters"
 	select MII
+	select CRC32
 	help
 	  This option adds support for Realtek RTL8152 based USB 2.0
 	  10/100 Ethernet adapters and RTL8153 based USB 3.0 10/100/1000
@@ -113,6 +114,7 @@ config USB_LAN78XX
 	select PHYLIB
 	select MICROCHIP_PHY
 	select FIXED_PHY
+	select CRC32
 	help
 	  This option adds support for Microchip LAN78XX based USB 2
 	  & USB 3 10/100/1000 Ethernet adapters.
@@ -238,6 +240,7 @@ config USB_NET_CDCETHER
 config USB_NET_CDC_EEM
 	tristate "CDC EEM support"
 	depends on USB_USBNET
+	select CRC32
 	help
 	  This option supports devices conforming to the Communication Device
 	  Class (CDC) Ethernet Emulation Model, a specification that's easy to
@@ -385,6 +388,7 @@ config USB_NET_PLUSB
 config USB_NET_MCS7830
 	tristate "MosChip MCS7830 based Ethernet adapters"
 	depends on USB_USBNET
+	select CRC32
 	help
 	  Choose this option if you're using a 10/100 Ethernet USB2
 	  adapter based on the MosChip 7830 controller. This includes
-- 
2.27.0

