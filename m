Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DC9C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 16:00:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F366112F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 16:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11F366112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duPn4YGMaiG5xyWHH/2AuYxjsqJt7+UbjwSGvDGDrZo=; b=bm3sPm0U7tXoFD
	Pb9blR1wovRgVvAncERhnaZWdpp1gYRUYyNE5YGzuMmWljN1kzgmUWpPTTIqvndlWWFb3o699B6xg
	3HYfnmOfM2cQj+LQ45oZcPV9VvJ1gmm0doeIvcQ5pb15nKQAhVjgpShqZzWvP94pgfwKcRQdgOSIS
	9cWCSXVMedmzvjrq8wZFh298kaUOvZiAe9rSHaEg67/lIpFg20egzLmT9t6y5A7sQWaXefOzgJCOS
	lLp0DsZS4OkGirj9mwjsd3niVafP3Aswe84cyApYe1BqqZEnmenCAKZJQqFCZM27okwpL17JInI8S
	7ep5f8hUtn9iIUqIrScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBflI-00AA5B-94; Thu, 05 Aug 2021 15:58:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfkX-00A9P7-Fu
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 15:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628179057; x=1659715057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQl9AlCuDacGfJoIF98Qycj10z8f5287AQL5vcdN88k=;
 b=UDMBLZ3yjhJ8Po6OBY22k6fnycYDQCkU+p4Znn/LYQgq7AEeZCDpqYjY
 l9SCbT09rtkAjjj9yR9raJ50DvbqUOi7cSVCd+cZNtaecXAuKBMUrBJ57
 5eMEZ9AkQSDDYbDkC10PZQfZN0pM+wZA2gWkyseX69B1LVrLElnuyNzd7
 MqdJfTs3KXZPSMJ/WxEQ2XvRlY76FUAbs2TGvsdUtmBc8INrmRuqy/9iI
 dKP0t4yJYOW/aWWRClrH2PDQ68SmtZiMzmS/mu9naFS2FigfMtbdxKivt
 kEzclBBW+veTdGiREcWBxeQ2x0X8/8od75U6cqqKF379nRSFcIWEBxlPK Q==;
IronPort-SDR: UfZ+c3PsOzRwMGoeRX9G5K4cr37RM9qbpUsnKFxmPFvrtdZ9BtoYJdT8n/e2B1MKhNE0XNSzkW
 4PCYuEl39IzuUP2JiEHBRLqEmoABq/AwoGiT9Dq1Sq0sY7WNh7CcInijDO0JnxgZQ4456P2p/6
 FDvnMH2euq9vjNOB/AMlVUUVpMDF87kyWB2RPpaI7AwCM0STBJlvf45GD7JYJFG2MaEc9vJ4yo
 N0ZfPuLBS0KQIJrJxOVIiccgiphL6YrtV7GOA4c/v5lZ3Kfc1HNA03UU0sqWNACyyRrypfOvPp
 tIH/Z26bgxSPSeXXBSbailrP
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="127242435"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2021 08:57:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:57:35 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:57:31 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Adam Porter <porter.adam@gmail.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>
Subject: [PATCH 7/7] ARM: dts: at91: add CalAmp LMU5000 board
Date: Thu, 5 Aug 2021 18:53:57 +0300
Message-ID: <20210805155357.594414-8-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_085737_674371_CD7ED5AF 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210805155357.yvawXmem921ILWHtzGfqSfG8ZyiUjZGtBtOxEAd3yvY@z>

From: Adam Porter <porter.adam@gmail.com>

Add CalAmp LMU5000 board. The base device tree is from OpenWrt tree and
with the addition of this patch there will be no need to maintain it
separatelly in OpenWrt.

[porter.adam: original author of patch in OpenWrt]
Signed-off-by: Adam Porter <porter.adam@gmail.com>
[claudiu.beznea: fixed compilation warnings, use &<lable> syntax,
 sorted nodes in alphabetical order, adapted flash to new support
 in kernel 5.14, use proper compatibles according to kernel 5.14,
 use macros instead of hard coded numbers for pinctrl phandles and
 for all pinctrl references, add pinctrl-names, pinctrl-X where
 necessary]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/Makefile         |   1 +
 arch/arm/boot/dts/at91-lmu5000.dts | 148 +++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 arch/arm/boot/dts/at91-lmu5000.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 34f6ead22048..07be55262516 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -25,6 +25,7 @@ dtb-$(CONFIG_SOC_AT91SAM9) += \
 	usb_a9263.dtb \
 	at91-foxg20.dtb \
 	at91-kizbox.dtb \
+	at91-lmu5000.dtb \
 	at91sam9g20ek.dtb \
 	at91sam9g20ek_2mmc.dtb \
 	tny_a9g20.dtb \
diff --git a/arch/arm/boot/dts/at91-lmu5000.dts b/arch/arm/boot/dts/at91-lmu5000.dts
new file mode 100644
index 000000000000..6a52728cc98f
--- /dev/null
+++ b/arch/arm/boot/dts/at91-lmu5000.dts
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device Tree file for CalAmp LMU5000 board
+ *
+ * Copyright (C) 2013 Adam Porter <porter.adam@gmail.com>
+ */
+
+/dts-v1/;
+#include "at91sam9g20.dtsi"
+
+/ {
+	model = "CalAmp LMU5000";
+	compatible = "calamp,lmu5000", "atmel,at91sam9g20", "atmel,at91sam9";
+
+	chosen {
+		bootargs = "mem=64M console=ttyS0,115200 rootfstype=jffs2";
+	};
+
+	memory {
+		reg = <0x20000000 0x4000000>;
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		main_clock: clock@0 {
+			compatible = "atmel,osc", "fixed-clock";
+			clock-frequency = <18432000>;
+		};
+	};
+};
+
+&dbgu {
+	status = "okay";
+};
+
+&ebi {
+	status = "okay";
+
+	nand_controller: nand-controller {
+		pinctrl-0 = <&pinctrl_nand_cs &pinctrl_nand_rb>;
+		pinctrl-names = "default";
+		status = "okay";
+
+		nand@3 {
+			reg = <0x3 0x0 0x800000>;
+			rb-gpios = <&pioC 13 GPIO_ACTIVE_HIGH>;
+			cs-gpios = <&pioC 14 GPIO_ACTIVE_HIGH>;
+			nand-bus-width = <8>;
+			nand-ecc-mode = "soft";
+			nand-on-flash-bbt;
+			label = "atmel_nand";
+			status = "okay";
+
+			partitions {
+				compatible = "fixed-partitions";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				kernel@0 {
+					label = "kernel";
+					reg = <0x0 0x400000>;
+				};
+
+				rootfs@400000 {
+					label = "rootfs";
+					reg = <0x400000 0x3C00000>;
+				};
+
+				user1@4000000 {
+					label = "user1";
+					reg = <0x4000000 0x2000000>;
+				};
+
+				user2@6000000 {
+					label = "user2";
+					reg = <0x6000000 0x2000000>;
+				};
+			};
+		};
+	};
+};
+
+&macb0 {
+	phy-mode = "mii";
+	status = "okay";
+};
+
+&pinctrl {
+	board {
+		pinctrl_pck0_as_mck: pck0_as_mck {
+			atmel,pins = <AT91_PIOC 1 AT91_PERIPH_B AT91_PINCTRL_NONE>;
+		};
+	};
+
+	usb0 {
+		pinctrl_usb1_vbus_gpio: usb0_vbus_gpio {
+			atmel,pins = <AT91_PIOC 5 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
+		};
+	};
+};
+
+&ssc0 {
+	status = "okay";
+	pinctrl-0 = <&pinctrl_ssc0_tx>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usart0 {
+	pinctrl-0 =
+		<&pinctrl_usart0
+		 &pinctrl_usart0_rts
+		 &pinctrl_usart0_cts
+		 &pinctrl_usart0_dtr_dsr
+		 &pinctrl_usart0_dcd
+		 &pinctrl_usart0_ri>;
+	status = "okay";
+};
+
+&usart2 {
+	status = "okay";
+};
+
+&usb0 {
+	num-ports = <2>;
+	status = "okay";
+};
+
+&usb1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1_vbus_gpio>;
+	atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};
+
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
