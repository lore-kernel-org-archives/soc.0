Return-Path: <SRS0=mXWp=KZ=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE528C47093
	for <soc@archiver.kernel.org>; Sun, 30 May 2021 09:26:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 99B0C611AC; Sun, 30 May 2021 09:26:46 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8EB7611AE;
	Sun, 30 May 2021 09:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8EB7611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=stefan.wahren@i2se.com
Received: from localhost.localdomain ([37.4.249.151]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N6bwO-1lLJgV48Kc-017zow; Sun, 30 May 2021 11:26:26 +0200
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
Subject: [PATCH 6/6] arm64: dts: broadcom: Add reference to RPi 400
Date: Sun, 30 May 2021 11:26:15 +0200
Message-Id: <1622366775-5309-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:q/IbM1RlSms3sEeZn3zRYhinPp/899xwqhVcoiG5y1OBVgwsH6O
 e7PYL8xAInkdBGzu1pOE39H3F6P9naNEqYuwAc2mpB1xyVd5yvqvtTi658nyWWz/82oD93a
 3pkVyQzPykdSjEGnG44qgyV2CFFgG/9NvEtNjADpNfOqWDnJ5sUAZ4jUIhhg8Vrjwyaj2jX
 qIWusPryam50OJwErfRZA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mju3w2jQjGc=:3jeTML6iMxctlGtCXzoSbA
 zwlvr5OyBCNqFLSUOhJ/T9zgQMAH6EOsUeqY5HiuWTYdGgVnVt9hGuRNVie2LZPEh3BGfM3T6
 OqE0716A90G4quNQ7SamvcvomRKgtNRMwamzKI/huIOUbOG4/l+b0gBTscn/w51XsG+vk0eNW
 eTs/GaWkNk9uvmzGmoyn71cwVQK+yF0F0/4/XbaJKScptNnuoqkmEaoIafFwHD/c/5GEAjE3K
 PTFM3oxkCN5cW/UNLVHl+305m1HrqMaeWnLRY3GTm207x/weU0iGoTMfRxnw2BbJaqqYGCNDC
 iIsqV+8//ToAobliW5LFFMr1T15l3PSdWaolSVr5WcS1JxB8yBJKE5y1lNVknMUTfYXjsYLh/
 oCvsi1B+sQKJD66agRWgCW1JHtTxVWiDI9aS/6ceoWvH3+i2KsZ8W3HweNKdE4Y7583atVle0
 nS62CzSjpjRgMiGP0slRljV2RAa91HZ8aDpO+/cx+cq74PfrQf7syfLwxTX6979YRCZAj8Cmf
 chqmXcWOYgNcmADcGiAkbA=

This adds a reference to the dts of the Raspberry Pi 400,
so we don't need to maintain the content in arm64.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
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

