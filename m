Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D78FC433FE
	for <soc@archiver.kernel.org>; Thu,  3 Dec 2020 23:10:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0B25C2245C; Thu,  3 Dec 2020 23:10:55 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: mmp2-olpc-xo-1-75: add back #address-cells
Date: Fri,  4 Dec 2020 00:10:43 +0100
Message-Id: <20201203231050.1482419-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A previous fix tried to address a dtc warning, but added a different
one in the process:

arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
  also defined at arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts:225.7-237.3
arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
  also defined at arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts:225.7-237.3
arch/arm/boot/dts/mmp2-olpc-xo-1-75.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'

Add back the two properties, but use the correct value <0> for
an spi slave node.

Fixes: f45200b67ea3 ("ARM: dts: mmp2-olpc-xo-1-75: Delete #address-cells from ssp3")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
index adde62d6fce7..342304f5653a 100644
--- a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
@@ -223,8 +223,7 @@ accelerometer@1d {
 };
 
 &ssp3 {
-	/delete-property/ #address-cells;
-	/delete-property/ #size-cells;
+	#address-cells = <0>;
 	spi-slave;
 	status = "okay";
 	ready-gpios = <&gpio 125 GPIO_ACTIVE_HIGH>;
-- 
2.27.0

