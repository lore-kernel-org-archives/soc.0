Return-Path: <SRS0=zXmn=M4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9B3C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:59:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2878B61131
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Aug 2021 15:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2878B61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoYQMpwUw81Ox2P1/fYhjqboTSo8WKZBYc2Hyq8M/Yw=; b=bT0UashnnGL4Xw
	X+9xKduwv/iP01Z45yiCq92jhLfZI5Dp4gfJ9SQ8vQlX5PwrKLBYCSttrmjMiH7p9pmXI/oZXsoV1
	P5K1w7gouFLbm0qNhpfmUv+HTE70uPqNtu0G2NL6vp8E+L88jDpXKIl2AltJsgB3Noy4gAohTgvOA
	2iM9J7TkCe33qGxlZQPD2nr/WyBF/Ubmksv3gAagQSbypQVanJasbo7J1zLecKKuff0cRR1rKPcee
	SqYgb2W4YR6OqiNmpuoNwZE5zcn9XTsMQFvPvwPVEtrAJdBNLPpAHtyvWCE7C/6s0QRgQc7+DBzXW
	QSy0yABdpe3YhmPRAz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfkC-00A9AJ-Ui; Thu, 05 Aug 2021 15:57:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfk1-00A8rd-Kr
 for linux-arm-kernel@lists.infradead.org; Thu, 05 Aug 2021 15:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1628179025; x=1659715025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5gshn+ndLTNLaJOXhDWq2MJv71jOmn7LjkIb/upL/o=;
 b=o0kllzEEwlfkWISR7spWICXKXJ6U6Bsmj0zSkAHjwAea2lzZyPexmCZc
 /i4Yh8AfUzQ60O8cffq3UKMEz8LKxA7X2PoZ296dYCe+pbsM+gBAjsPxx
 A+veG50xOw0IZTLAT4ts67lB8Ta3299+mM2qLtOpMvGQX3CKaGqgmF+7Y
 TZ2+/83KRlpxw1ACgEKStYuWmLnbw5jX5g95kM8x9dYBOAkfRDgMp+aW+
 bi0GpTUoq+dRjwyTH9klpJZ1vEEzK/n8r1y77MPTW5HJQqN0xAGQYO7aX
 fO9SK2kikCCqbqUe/gY1HRVvXLwHTAaExJ5+4X3b8j4xNl9z5Wbn3ShYf A==;
IronPort-SDR: ZP5vd4j7oXKVUvUjqDixpZ4Zw9xsBC8DMnImtlv2Un/WTfX/pPaOE9BsPA8Plxcb0VaLvxc7mE
 EiId0RnZ1vd0/fRV+NjqvshjglIDqPb558ut2QKBKwdCYQEqNdExmXC8j9MzwQ9dFFrqCQKNAx
 Ip2G0ei+NSATbes51A04qqqe4SLNcGVLftQFMNE7GJaaDaIMMt/SEBapS385RpASuYe/b4HKF6
 llGPxOObVJ/fSow6VZ+Gt3yLguijpI/N/k1E960az17fUwHN9CfUMO8qJNAR7tomWzE5EnMv9n
 zMxwXb2UqFO19WL3v9AJmYrJ
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="124734247"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Aug 2021 08:57:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:57:03 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:56:54 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
 <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Owen Kirby <osk@exegin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>
Subject: [PATCH 4/7] ARM: dts: at91: add Exegin Q5xR5 board
Date: Thu, 5 Aug 2021 18:53:54 +0300
Message-ID: <20210805155357.594414-5-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_085705_857345_507DEFD4 
X-CRM114-Status: GOOD (  14.73  )
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
Message-ID: <20210805155354.E3KcYiC40d5YnEfwFRz44GK-cdWdmeMOSwzFgO6lR-A@z>

From: Owen Kirby <osk@exegin.com>

Add Exegin Q5xR5. The base device tree is from OpenWrt tree and with
the addition of this patch there will be no need to maintain it
separatelly in OpenWrt.

[osk: original author of patch in OpenWrt]
Signed-off-by: Owen Kirby <osk@exegin.com>
[claudiu.beznea: use "&<label> {" syntax, sorted nodes in alphabetical
 order, adapted flash to new support in kernel 5.14, use proper
 compatibles according to kernel 5.14, use macros instead of
 hardcoded numbers for pinctrl phandles and for all pinctrl references,
 add pinctrl-names, pinctrl-X where necessaray]
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/Makefile       |   1 +
 arch/arm/boot/dts/at91-q5xr5.dts | 200 +++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 arch/arm/boot/dts/at91-q5xr5.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 63b60f571035..34f6ead22048 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_SOC_AT91SAM9) += \
 	at91-kizboxmini-base.dtb \
 	at91-kizboxmini-mb.dtb \
 	at91-kizboxmini-rd.dtb \
+	at91-q5xr5.dtb \
 	at91-smartkiz.dtb \
 	at91-wb45n.dtb \
 	at91sam9g15ek.dtb \
diff --git a/arch/arm/boot/dts/at91-q5xr5.dts b/arch/arm/boot/dts/at91-q5xr5.dts
new file mode 100644
index 000000000000..4866f1c6ccf9
--- /dev/null
+++ b/arch/arm/boot/dts/at91-q5xr5.dts
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device Tree file for Exegin Q5xR5 board
+ *
+ * Copyright (C) 2014 Owen Kirby <osk@exegin.com>
+ */
+
+/dts-v1/;
+#include "at91sam9g20.dtsi"
+
+/ {
+	model = "Exegin Q5x (rev5)";
+	compatible = "exegin,q5xr5", "atmel,at91sam9g20", "atmel,at91sam9";
+
+	chosen {
+		bootargs = "console=ttyS0,115200 rootfstype=squashfs,jffs2";
+	};
+
+	memory {
+		reg = <0x20000000 0x0>;
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
+
+		slow_xtal {
+			clock-frequency = <32768>;
+		};
+
+		main_xtal {
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
+	flash: flash@0 {
+		compatible = "cfi-flash";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x0 0x1000000 0x800000>;
+		bank-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			kernel@0 {
+				label = "kernel";
+				reg = <0x0 0x200000>;
+			};
+
+			rootfs@200000 {
+				label = "rootfs";
+				reg = <0x200000 0x600000>;
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
+	spi0 {
+		pinctrl_spi0: spi0-0 {
+			atmel,pins =
+				<AT91_PIOA 0 AT91_PERIPH_A AT91_PINCTRL_NONE
+				 AT91_PIOA 1 AT91_PERIPH_A AT91_PINCTRL_NONE
+				 AT91_PIOA 2 AT91_PERIPH_A AT91_PINCTRL_NONE>;
+		};
+
+		pinctrl_spi0_npcs0: spi0_npcs0 {
+			atmel,pins = <AT91_PIOA 3 AT91_PERIPH_A AT91_PINCTRL_NONE>;
+		};
+
+		pinctrl_spi0_npcs1: spi0_npcs1 {
+			atmel,pins = <AT91_PIOC 11 AT91_PERIPH_B AT91_PINCTRL_NONE>;
+		};
+	};
+
+	spi1 {
+		pinctrl_spi1: spi1-0 {
+			atmel,pins =
+				<AT91_PIOB 0 AT91_PERIPH_A AT91_PINCTRL_NONE
+				 AT91_PIOB 1 AT91_PERIPH_A AT91_PINCTRL_NONE
+				 AT91_PIOB 2 AT91_PERIPH_A AT91_PINCTRL_NONE>;
+		};
+
+		pinctrl_spi1_npcs0: spi1_npcs0 {
+			atmel,pins = <AT91_PIOB 3 AT91_PERIPH_A AT91_PINCTRL_NONE>;
+		};
+
+		pinctrl_spi1_npcs1: spi1_npcs1 {
+			atmel,pins = <AT91_PIOC 5 AT91_PERIPH_B AT91_PINCTRL_NONE>;
+		};
+	};
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi0 &pinctrl_spi0_npcs0 &pinctrl_spi0_npcs1>;
+	cs-gpios = <&pioA 3 GPIO_ACTIVE_HIGH>, <&pioC 11 GPIO_ACTIVE_LOW>, <0>, <0>;
+	status = "okay";
+
+	m25p80@0 {
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		at91boot@0 {
+			label = "at91boot";
+			reg = <0x0 0x4000>;
+		};
+
+		uenv@4000 {
+			label = "uboot-env";
+			reg = <0x4000 0x4000>;
+		};
+
+		uboot@8000 {
+			label = "uboot";
+			reg = <0x8000 0x3E000>;
+		};
+	};
+
+	spidev@1 {
+		compatible = "spidev";
+		spi-max-frequency = <2000000>;
+		reg = <1>;
+	};
+};
+
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1 &pinctrl_spi1_npcs0 &pinctrl_spi1_npcs1>;
+	cs-gpios = <&pioB 3 GPIO_ACTIVE_HIGH>, <&pioC 5 GPIO_ACTIVE_LOW>, <0>, <0>;
+	status = "okay";
+
+	spidev@0 {
+		compatible = "spidev";
+		spi-max-frequency = <2000000>;
+		reg = <0>;
+	};
+
+	spidev@1 {
+		compatible = "spidev";
+		spi-max-frequency = <2000000>;
+		reg = <1>;
+	};
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
+&usb0 {
+	num-ports = <2>;
+	status = "okay";
+};
+
+&usb1 {
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
