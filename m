Return-Path: <SRS0=Szqg=LA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE852C47096
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77203611CA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jun 2021 12:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77203611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxTmilAgPWpdP2fPhknH4zWsQCdI/skBjJiUT0qwl90=; b=fO5HJ5jVOkqzFz
	8mFnJqSzKsvt3ckKENf2nGH+YbtdIkXfU28z9XfQPJuONFlY0knbnRFlsQcvbEDKcd9e7YjkEAfVq
	7U6EOnpDbQ8knGUDJv2WwI5VHQqS99z/kUYT+jkw6eKt/saio5vjugyjCqvlOfcdwMP4c6T/E0JXv
	rhRuMDTaQ6bzVF6oSl+tK7rvfLHuS8hJzaW7NNEsI7+/fi6WpLR7YTNlZiOvw95I/K+YugNu8bpbX
	N5RYzoI9UPsvKobdiB1DJJ+7Jp+n3eK9+qOv9AR/nY5XWMbqHtfRiXI9SUXSGmq98tq96hlHg0YXr
	Zgs2FsW9cBDeQsX0af0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lprja-000ETh-RY; Sun, 06 Jun 2021 12:18:31 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpri3-000E00-TP; Sun, 06 Jun 2021 12:16:57 +0000
Received: from localhost.localdomain ([37.4.249.157]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MrhHm-1l2AsK2p88-00ngV6; Sun, 06 Jun 2021 14:16:36 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Rob Herring <robh+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 6/7] ARM: dts: Add Raspberry Pi 400 support
Date: Sun,  6 Jun 2021 14:16:16 +0200
Message-ID: <1622981777-5023-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
References: <1622981777-5023-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:qDXNiQNnXszhu7ZZn9qpiJjEOk/8SKuGCRk5P1O58HSgHSRlMLV
 0xTH6Q+aPq28bWe7QSGDeV5lSsliVSiBA3k6TJs3CJKeIAEw7NFeK3ulpqriEj9rG7Kv09V
 f5yU99ZAK5+2om8JacoafiHBpbVGX9mLuw67b41uH2+buQZXHhd/vEsMYJuZdrkoAqxavb0
 XZzPZDPPXY9LZ3wix21Rw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TznBIvEQkDg=:GcLEDfRD80lGvCBDkMB65D
 n2NlGC6mkIjaUFrd5E9zZjH4kw+x9NA0hx9T0NWVp1ziEK3LHEL0hbgRb1eGvl867sbWe8Q/e
 F+/chJU1Mx0LnCpYtoSWFgn78hnQZJhGVxXq5//4mI3VEtfF9AR8GB+3HGCKfwrJIMGBo5Z5C
 Kbv39tIHz3XTISYrHVYqeoxMUNOZQ33vvSjziiWgEbr8MNV4my2sannMZeUBZQ1rfAUiOwJdE
 SafIVH+YbqGPYzy6kL1rz9v/wvq8qLcckHQlUI7bRNlhEUMt+smWFRhRRCDF6cnMKFbpNxf8N
 cBTBrYFLng5QRI23HFhu4XUe22u54bxcSeBToKQ7m/X1ARrVXdad++bxXayrAO+wwp6+KjdsO
 UGB4w5h4r4fw8SOAfV/4qpN4GcpWhnUdDQGkcIQFY4lXIGnOubFKi8EQK9Nu9O9Ky4v15aqXU
 wlW2w05R7Nw3UkdBbPiUzlEKUKxOxWAdrONwwMZxYNrKR2vf/cjHXKSLx2b3F9MzPOiS/NmA1
 J486J/wnFJuU58pVA9Dftc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_051656_294529_2C4D5ABB 
X-CRM114-Status: GOOD (  14.96  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210606121616.qYnk0Vmwmo6qoT_yN2_I3phMkSlKt9QBwmphRj0tIDs@z>

The Raspberry Pi 400 is like a Pi 4 B designed into a keyboard. But there
are some minor differences:

- higher CPU clock rate (1.8 GHz)
- different Wifi chip (BCM43456)
- power off is now handled via GPIO
- no ACT LED

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/Makefile            |  1 +
 arch/arm/boot/dts/bcm2711-rpi-400.dts | 45 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-400.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f8f09c5..ec00dba 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2837-rpi-3-b.dtb \
 	bcm2837-rpi-3-b-plus.dtb \
 	bcm2837-rpi-cm3-io3.dtb \
+	bcm2711-rpi-400.dtb \
 	bcm2711-rpi-4-b.dtb \
 	bcm2835-rpi-zero.dtb \
 	bcm2835-rpi-zero-w.dtb
diff --git a/arch/arm/boot/dts/bcm2711-rpi-400.dts b/arch/arm/boot/dts/bcm2711-rpi-400.dts
new file mode 100644
index 0000000..f4d2fc2
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2711-rpi-400.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+#include "bcm2711-rpi-4-b.dts"
+
+/ {
+	compatible = "raspberrypi,400", "brcm,bcm2711";
+	model = "Raspberry Pi 400";
+
+	chosen {
+		/* 8250 auxiliary UART instead of pl011 */
+		stdout-path = "serial1:115200n8";
+	};
+
+	leds {
+		/delete-node/ led-act;
+
+		led-pwr {
+			gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-poweroff {
+		compatible = "gpio-poweroff";
+		gpios = <&expgpio 5 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&expgpio {
+	gpio-line-names = "BT_ON",
+			  "WL_ON",
+			  "",
+			  "GLOBAL_RESET",
+			  "VDD_SD_IO_SEL",
+			  "CAM_GPIO",
+			  "SD_PWR_ON",
+			  "SD_OC_N";
+};
+
+&genet_mdio {
+	clock-frequency = <1950000>;
+};
+
+&pm {
+	/delete-property/ system-power-controller;
+};
-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
