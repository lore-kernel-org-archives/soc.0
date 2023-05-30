Return-Path: <SRS0=Ol/B=BT=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38FEC7EE23
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 17:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74D84C433A1; Tue, 30 May 2023 17:56:37 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0455C4339B
	for <soc@kernel.org>; Tue, 30 May 2023 17:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0455C4339B
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43aB-0003Qj-Mg; Tue, 30 May 2023 19:56:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43aB-003vWJ-03; Tue, 30 May 2023 19:56:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q43aA-009Zpd-CC; Tue, 30 May 2023 19:56:30 +0200
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
Subject: [PATCH 1/2] arm64: dts: broadcom: Enable device-tree overlay support for RPi devices
Date: Tue, 30 May 2023 19:56:23 +0200
Message-Id: <20230530175624.2360218-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
References: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=UxD0BnjOijw8hop6KACDNBULeVXO8NHe9NFdVmMqZys=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdjjEUfJNN4OmIxHXcZ6fijOGCuMbVu13FyvvP PFW3Ix+R5qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHY4xAAKCRCPgPtYfRL+ TmFUB/sG6zF3fhza5E9MBFcsiSJo1Cyjcsu5kOmAo6eD+iONaNHDWsWquiVaNpgl+EavkcDwi8G xyaMzS/99MjAa+O7hnsSzmjg1HLTVYMFD34MAFWwvIlg/mWLYG6s49ig7Tjc6NNWs2SXhV+nsuQ yKWFF3NSQB5sVszj/JUUppOnL9V0yxvj1g6TZJ5TmviKq5dncGq5tCs/MuPmbLvJD+5ecvBYf7E rgFzuUp15YeGBAmvvfSdC5yM54sWlW6v1lmSzqXKb6z/892oEzzjm0vXsfLKOE8vYYffC4Bi9S5 A5D4x/ax4RrKqUlqZ2Al7tcPMKXVMeveytTPXzL0JfERIyHi
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
  bcm2837-rpi-3-a-plus.dtb  14930 -> 20713 bytes
  bcm2837-rpi-3-b.dtb       15107 -> 20979 bytes
  bcm2837-rpi-3-b-plus.dtb  15463 -> 21443 bytes
  bcm2837-rpi-cm3-io3.dtb   14429 -> 20098 bytes
  bcm2837-rpi-zero-2-w.dtb  14781 -> 20524 bytes

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Link: https://lore.kernel.org/r/20220410225940.135744-2-aurelien@aurel32.net
[ukleinek: rebased to v6.4, replaced by a single assignment to DTC_FLAGS]
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm64/boot/dts/broadcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 05d8c5ecf3b0..8b4591ddd27c 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# Enables support for device-tree overlays
+DTC_FLAGS := -@
+
 dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2711-rpi-4-b.dtb \
 			      bcm2711-rpi-cm4-io.dtb \
-- 
2.39.2

