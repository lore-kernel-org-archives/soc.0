Return-Path: <SRS0=Ol/B=BT=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F56BC7EE24
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 17:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E7EAC433EF; Tue, 30 May 2023 17:56:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AB57C4339E
	for <soc@kernel.org>; Tue, 30 May 2023 17:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2AB57C4339E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43aB-0003Qm-Ss; Tue, 30 May 2023 19:56:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43aB-003vWM-67; Tue, 30 May 2023 19:56:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43aA-009Zpg-IF; Tue, 30 May 2023 19:56:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm: dts: Enable device-tree overlay support for RPi devices
Date: Tue, 30 May 2023 19:56:24 +0200
Message-Id: <20230530175624.2360218-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
References: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2852; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EATKJ4RBPv2Qqpg/miNC+q7c8xFY0gbUB3j0UOy4qVk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdjjFx93FPlHN2stVSS3FSptj80daAj3ppaCui 3VydBavPGaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHY4xQAKCRCPgPtYfRL+ TvGxB/0YlOxRYyTZbJd2nLNapO9qMOxrS/Qa2ETiD6Ue8mn5iUor9naqCXPfi26NeVKZaB7gpzf 769P6/NWEZdodFOoTZK/kOuASISLyWOnGOpkNC1tnSw84rKSU0ZI5I+Hw06NKtHMPqdVGb+f/M/ QBNq54zU5nkySU7L7cuEIEXduXcc2jCiM3gGLa8bmUmePIGwYwTX4f+UhPZKQQlKLtU7XhvU3GX 9DW5UcAEG+zRRzD+kYMQLB4MpSRgG+iQ8ZusLmUYvg0iSot6MfOfmXRMvBv7E0Ht1KVqvodQ4i2 16DF9P46CmFFTZdNNi+wH9+xUschDLF/RwaqElv698IVTCly
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

From: Aurelien Jarno <aurelien@aurel32.net>

Add the '-@' DTC option for the Raspberry Pi devices. This option
populates the '__symbols__' node that contains all the necessary symbols
for supporting device-tree overlays (for instance from the firmware or
the bootloader) on these devices.

The Rasbperry Pi devices are well known for their GPIO header, that
allow various "HATs" or other modules do be connected and this enables
users to create out-of-tree device-tree overlays for these modules.

Please note that this change does increase the size of the resulting DTB
by ~40%. For example, with v6.4-rc1 increase in size is as follows:

  bcm2711-rpi-400.dtb       27556 -> 38141 bytes
  bcm2711-rpi-4-b.dtb       27484 -> 38069 bytes
  bcm2711-rpi-cm4-io.dtb    27373 -> 38076 bytes
  bcm2835-rpi-a.dtb         12879 -> 18235 bytes
  bcm2835-rpi-a-plus.dtb    13015 -> 18371 bytes
  bcm2835-rpi-b.dtb         12997 -> 18377 bytes
  bcm2835-rpi-b-plus.dtb    13237 -> 18666 bytes
  bcm2835-rpi-b-rev2.dtb    13085 -> 18514 bytes
  bcm2835-rpi-cm1-io1.dtb   13109 -> 18528 bytes
  bcm2835-rpi-zero.dtb      12923 -> 18311 bytes
  bcm2835-rpi-zero-w.dtb    13449 -> 18889 bytes
  bcm2836-rpi-2-b.dtb       14500 -> 20252 bytes
  bcm2837-rpi-3-a-plus.dtb  14930 -> 20713 bytes
  bcm2837-rpi-3-b.dtb       15107 -> 20979 bytes
  bcm2837-rpi-3-b-plus.dtb  15463 -> 21443 bytes
  bcm2837-rpi-cm3-io3.dtb   14429 -> 20098 bytes
  bcm2837-rpi-zero-2-w.dtb  14781 -> 20524 bytes

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Link: https://lore.kernel.org/r/20220410225940.135744-3-aurelien@aurel32.net
[ukleinek: rebased to v6.4-rc1]
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/boot/dts/Makefile | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 59829fc90315..68e89f9289ef 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -85,6 +85,24 @@ dtb-$(CONFIG_SOC_SP7021) += \
 	sunplus-sp7021-demo-v3.dtb
 dtb-$(CONFIG_ARCH_AXXIA) += \
 	axm5516-amarillo.dtb
+# Enables support for device-tree overlays
+DTC_FLAGS_bcm2835-rpi-b := -@
+DTC_FLAGS_bcm2835-rpi-a := -@
+DTC_FLAGS_bcm2835-rpi-b-rev2 := -@
+DTC_FLAGS_bcm2835-rpi-b-plus := -@
+DTC_FLAGS_bcm2835-rpi-a-plus := -@
+DTC_FLAGS_bcm2835-rpi-cm1-io1 := -@
+DTC_FLAGS_bcm2836-rpi-2-b := -@
+DTC_FLAGS_bcm2837-rpi-3-a-plus := -@
+DTC_FLAGS_bcm2837-rpi-3-b := -@
+DTC_FLAGS_bcm2837-rpi-3-b-plus := -@
+DTC_FLAGS_bcm2837-rpi-cm3-io3 := -@
+DTC_FLAGS_bcm2837-rpi-zero-2-w := -@
+DTC_FLAGS_bcm2711-rpi-400 := -@
+DTC_FLAGS_bcm2711-rpi-4-b := -@
+DTC_FLAGS_bcm2711-rpi-cm4-io := -@
+DTC_FLAGS_bcm2835-rpi-zero := -@
+DTC_FLAGS_bcm2835-rpi-zero-w := -@
 dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2835-rpi-b.dtb \
 	bcm2835-rpi-a.dtb \
-- 
2.39.2

