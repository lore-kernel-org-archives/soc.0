Return-Path: <SRS0=8EHu=LP=pengutronix.de=ukl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E6BC4743C
	for <soc@archiver.kernel.org>; Mon, 21 Jun 2021 20:21:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8EB04610C7; Mon, 21 Jun 2021 20:21:36 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2213E608FC
	for <soc@kernel.org>; Mon, 21 Jun 2021 20:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2213E608FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=ukl@pengutronix.de
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1lvQQI-0004Fp-76; Mon, 21 Jun 2021 22:21:34 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1lvQQH-0000Vu-R8; Mon, 21 Jun 2021 22:21:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: Alexey Charkov <alchark@gmail.com>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] MAINTAINERS: Drop ARM/VT8500 entry
Date: Mon, 21 Jun 2021 22:21:31 +0200
Message-Id: <20210621202131.127802-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: soc@kernel.org

Tony's email addresses bounces since at least January 2021 and Alexey
Charkov claims already then he was MIA for quite a while. So drop the
entry.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
I mistyped the address of the lakml in my first try, so resend to the
right address now. Sorry to those of you who get the patch a second time
now :-\

Hello Alexey,

back in January you said there were still users and so the platform
wasn't removed. Arnd asked you for a MAINTAINERS update which didn't
happen though.

If you think the entry should stay and you want to be listed (as either
maintainer or odd fixer?) please speak up.

If you want to get active, please have a look at the two patches I sent
today: https://lore.kernel.org/r/20210621130458.118530-1-u.kleine-koenig@pengutronix.de

Best regards
Uwe

 MAINTAINERS | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..b59308a7646c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2726,24 +2726,6 @@ S:	Maintained
 F:	arch/arm/mach-pxa/include/mach/vpac270.h
 F:	arch/arm/mach-pxa/vpac270.c
 
-ARM/VT8500 ARM ARCHITECTURE
-M:	Tony Prisk <linux@prisktech.co.nz>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
-F:	arch/arm/mach-vt8500/
-F:	drivers/clocksource/timer-vt8500.c
-F:	drivers/i2c/busses/i2c-wmt.c
-F:	drivers/mmc/host/wmt-sdmmc.c
-F:	drivers/pwm/pwm-vt8500.c
-F:	drivers/rtc/rtc-vt8500.c
-F:	drivers/tty/serial/vt8500_serial.c
-F:	drivers/usb/host/ehci-platform.c
-F:	drivers/usb/host/uhci-platform.c
-F:	drivers/video/fbdev/vt8500lcdfb.*
-F:	drivers/video/fbdev/wm8505fb*
-F:	drivers/video/fbdev/wmt_ge_rops.*
-
 ARM/ZIPIT Z2 SUPPORT
 M:	Marek Vasut <marek.vasut@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.30.2

