Return-Path: <SRS0=ICZO=LA=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D53C47096
	for <soc@archiver.kernel.org>; Sun,  6 Jun 2021 12:17:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0989D6124C; Sun,  6 Jun 2021 12:17:00 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E6E61059;
	Sun,  6 Jun 2021 12:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E6E61059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=stefan.wahren@i2se.com
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M4b5s-1lpJTP14fG-001gEM; Sun, 06 Jun 2021 14:16:37 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 7/7] arm64: dts: broadcom: Add reference to RPi 400
Date: Sun,  6 Jun 2021 14:16:17 +0200
Message-Id: <1622981777-5023-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:yQabTqkX47ibDNJg4fwGitdfVsJvfe3A8a/9Q17mnamUZCUWQD+
 7uuOMkf4ZjSUPT8dwp9Aevg2o4CVeCNByyza3MEmZ0kTixP4SB4kbSBeX88RQjpLRlGyjvf
 0eiSAXv816T4jzTXOzRsfYsbWvgTl9pJcusI3jqwQ/cxfwR14Np+9i48Mc0k7/F5lVmuiRm
 u79E49GcIYcyKP2hIQLYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:age9Y4juz4M=:xKIjLn2ZqpPYY+UCVH1snQ
 t/NYA5TLET0jglDSd1zF/3HJVjCx/nevPejwPXUI4uMhW9ka6S2Lv4I6PCIwlMV9CoFceHfKH
 i3Umf4GKUbahxwHLJkvJIR7Dhb/0LjKigIxzGZp9FIEg2bhbsEQF5yDbzSf8vjf3oxq7Dyn/a
 DQxDNaWu945l1u4epTAMXg2y5ISauvSJogks/g8GYPNV4IyhYEFPPNx2vQmVI4Qjmbk5SsYgr
 gFmYbpIu7lDJjYNs814GBDAGAl2/c5eaEl8fDfFGhhD3X3n0COokR/UCWIcBmqTrlZcgLQl5Z
 6Pyc+tEMGL/7LwgTGOMdkNec1RGEXYheo2Rm/rTUBtg/uOfBhY/jjKBWEGVR4C9epx6t80SQT
 c33B4zsGoz4uorHK6X2ds/2gFjwWRvxDMQWe6RVbHJh2TfYU/8dchXG4fxg1sQHvT/Nn/r2UI
 +mVqeBhqBXS8QJmb4X/YO1kIj+ByLHWxDkXPcV88CqYMGFW1TgQMYsw5EdtxUtPi8XfLizmga
 4OSPBR9RGY9z+zyEc1QBak=

This adds a reference to the dts of the Raspberry Pi 400,
so we don't need to maintain the content in arm64.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
---
 arch/arm64/boot/dts/broadcom/Makefile            | 3 ++-
 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 998e240..11eae3e 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-4-b.dtb \
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
+			      bcm2711-rpi-4-b.dtb \
 			      bcm2837-rpi-3-a-plus.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
diff --git a/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts
new file mode 100644
index 0000000..b9000f5
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dts
@@ -0,0 +1,2 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "arm/bcm2711-rpi-400.dts"
-- 
2.7.4

