Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AA8C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:48:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032216105A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 032216105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ey9tjjmmtrGc4jQEcKu+cHGHOVBxK5fAQw322GAmiQI=; b=YEM3JzsA1qOEGu
	RCW+69+1acsKhFyvl7qA1YhbEORy7qHzqhV3aLs6HRdPGPLnttSlX106JLFyVJ88Ommnc00lnz28k
	U2faHFKpK8rfiJARByeDxONmIfy0H8Z1SQUuxMH+5xXGMMRdHxtsxDl0ZSyzNQ1EFACqqAQsfHunR
	ot1jNXV63xOLZ4Y2g7qCq6WMgKqxwxtZfKmjffZ6zc6gdTehu+6K6umSSleoIiPXC1bDUk6QsV6JG
	GqQLTYi5iAYtFJHoXdEfSY+xZmbkZVBmU0dbqLX/01n2kUCcwF+GQWan7hg7Ne7vHup8rUNR67gq1
	UhVUF48ZIo/pDhxT+FNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6j8-00DX0P-9p; Fri, 06 Aug 2021 20:45:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6ip-00DWs8-NO
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 20:45:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso9786940wms.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 06 Aug 2021 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7bYcfTOZDcpH82FxHaeIsdSguONpuaB31Nv9U1ySCU=;
 b=I1JyJ3Ttyq6+1dtizwBqjPfnWC3n0L/uC+AiHThuqHh4g7OQx05ebfAmlMLfMnk0XZ
 F9GXgGeZITtrI3FP0lj8fSTXfLwMm3HyXfR8FqTZRhVMUyu8w9V/KvbXWLLo5JLJwJcG
 6aU31rDrvWjuFwnCZ1KpB4LLzk/BgOc5Fc2i/zpuCgoY7idDSj6Ni9x7mV+sT+83jpxt
 PwPZR8KIJciDvb++A5aEiVgycgPRnSv6zIjBpF49O/DA3F6Tbe8AO0ZgOki8jdSiOZFB
 1CD+GVJnMXHmsVwWlYPhQpZZ17t39G+vWwmfRshOQ0vO+KUlqQlT554AmF+cTdDQRU8n
 +MOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7bYcfTOZDcpH82FxHaeIsdSguONpuaB31Nv9U1ySCU=;
 b=SGZzNVKf4z8BgPGXq5NUduWHABk2qu/ItjNPG1sV9BqjUkEfjdPQQyHBCdSOlc0WPD
 73JIYIZjPzL0IOrlnXqQHAxp8FQaGslr3mAhiSYO5Z4uJfLR2J4Bt++WOBIxCu57DatI
 WxHRqITV3QkyhRkmCtUT0WpuOHtW5sRuu56rneAvEB37LcZkkp2FGBq1GkCZKtFa/Ror
 FXwCU8H92dDy9wS76zUQ03vtOmFOZtdXdoWCv2jbQH5ZAnuwUIxwcY3Kwg+XvRAYHZo/
 ZY39FAJK6SEuTGjiNrw7VPwrTvlwSOxRGzMo6X4ZFOLSaj35NWIW6tfMOhm3Bs2lEZBG
 ngOA==
X-Gm-Message-State: AOAM5304uZZ4ZJx/ix+TURMxW5wfXEqZ2xkf0Pe/lBBxFbB0rYz07DzC
 8Nt3PXo8tctZyxEa+uxTizaTC4WCawA=
X-Google-Smtp-Source: ABdhPJyQPWALHgmtTsFTWvfNHemx0dQt+3Kb31xkmV0b5Sv9eSy3fYYN6HHjb8/r4SKrFcOw7VvYFw==
X-Received: by 2002:a1c:2984:: with SMTP id p126mr5065274wmp.58.1628282737988; 
 Fri, 06 Aug 2021 13:45:37 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id y66sm9711543wmy.39.2021.08.06.13.45.37
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 06 Aug 2021 13:45:37 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 4/5] ARM: dts: NSP: Add DT files for Meraki MX65 series
Date: Fri,  6 Aug 2021 21:44:35 +0100
Message-ID: <20210806204446.2981299-5-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_134539_856416_8236CB96 
X-CRM114-Status: GOOD (  18.54  )
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
Message-ID: <20210806204435.i1CfnsAtS18vNWYK8WQuZzXBBiN_LlF_YMJIrVNoBaA@z>

MX65 & MX65W Hardware info:
  - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
  - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
  - Storage: 1 GB (Micron MT29F8G08ABACA)
  - Networking: BCM58625 switch (2x 1GbE ports)
    2x Qualcomm QCA8337 switches (10x 1GbE ports total)
  - PSE: Broadcom BCM59111KMLG connected to LAN ports 11 & 12
  - USB: 1x USB2.0
  - Serial: Internal header
  - WLAN(MX65W Only): 2x Broadcom BCM43520KMLG on the PCI bus.

Note that a driver and firmware image for the BCM59111 PSE has been
released under GPL, but this is not present in the kernel.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 279 ++++++++++++++++++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  24 ++
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  32 ++
 4 files changed, 337 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 17f7bdab50ef..3586b540e3b6 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -159,6 +159,8 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
 	bcm958625-meraki-mx64-a0.dtb \
 	bcm958625-meraki-mx64w.dtb \
 	bcm958625-meraki-mx64w-a0.dtb \
+	bcm958625-meraki-mx65.dtb \
+	bcm958625-meraki-mx65w.dtb \
 	bcm958625hr.dtb \
 	bcm988312hr.dtb \
 	bcm958625k.dtb
diff --git a/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi b/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
new file mode 100644
index 000000000000..8860f2fefc63
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65 series (Alamo).
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm958625-meraki-mx6x-common.dtsi"
+
+/ {
+	keys {
+		compatible = "gpio-keys-polled";
+		autorepeat;
+		poll-interval = <20>;
+
+		reset {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpioa 8 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			/* green:wan1-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			/* green:wan1-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		led-2 {
+			/* green:wan2-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
+		};
+
+		led-3 {
+			/* green:wan2-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <3>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		led-4 {
+			/* amber:power */
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_AMBER>;
+			gpios = <&gpioa 3 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-5 {
+			/* white:status */
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&gpioa 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	mdio-mii-mux {
+		compatible = "mdio-mux-mmioreg";
+		reg = <0x1803f1c0 0x4>;
+		mux-mask = <0x2000>;
+		mdio-parent-bus = <&mdio_ext>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mdio@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy_port6: phy@0 {
+				reg = <0>;
+			};
+
+			phy_port7: phy@1 {
+				reg = <1>;
+			};
+
+			phy_port8: phy@2 {
+				reg = <2>;
+			};
+
+			phy_port9: phy@3 {
+				reg = <3>;
+			};
+
+			phy_port10: phy@4 {
+				reg = <4>;
+			};
+
+			switch@10 {
+				compatible = "qca,qca8337";
+				reg = <0x10>;
+				dsa,member = <1 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						ethernet = <&sgmii1>;
+						phy-mode = "sgmii";
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan8";
+						phy-handle = <&phy_port6>;
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan9";
+						phy-handle = <&phy_port7>;
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan10";
+						phy-handle = <&phy_port8>;
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan11";
+						phy-handle = <&phy_port9>;
+					};
+
+					port@5 {
+						reg = <5>;
+						label = "lan12";
+						phy-handle = <&phy_port10>;
+					};
+				};
+			};
+		};
+
+		mdio-mii@2000 {
+			reg = <0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy_port1: phy@0 {
+				reg = <0>;
+			};
+
+			phy_port2: phy@1 {
+				reg = <1>;
+			};
+
+			phy_port3: phy@2 {
+				reg = <2>;
+			};
+
+			phy_port4: phy@3 {
+				reg = <3>;
+			};
+
+			phy_port5: phy@4 {
+				reg = <4>;
+			};
+
+			switch@10 {
+				compatible = "qca,qca8337";
+				reg = <0x10>;
+				dsa,member = <2 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						ethernet = <&sgmii0>;
+						phy-mode = "sgmii";
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan3";
+						phy-handle = <&phy_port1>;
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan4";
+						phy-handle = <&phy_port2>;
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan5";
+						phy-handle = <&phy_port3>;
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan6";
+						phy-handle = <&phy_port4>;
+					};
+
+					port@5 {
+						reg = <5>;
+						label = "lan7";
+						phy-handle = <&phy_port5>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&srab {
+	compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
+	status = "okay";
+	dsa,member = <0 0>;
+
+	ports {
+		port@0 {
+			label = "wan1";
+			reg = <0>;
+		};
+
+		port@1 {
+			label = "wan2";
+			reg = <1>;
+		};
+
+		sgmii0: port@4 {
+			label = "sw0";
+			reg = <4>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+
+		sgmii1: port@5 {
+			label = "sw1";
+			reg = <5>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+
+		port@8 {
+			ethernet = <&amac2>;
+			reg = <8>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65.dts
new file mode 100644
index 000000000000..d1b684dcdbfa
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx65.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-alamo.dtsi"
+
+/ {
+	model = "Cisco Meraki MX65";
+	compatible = "meraki,mx65", "brcm,bcm58625", "brcm,nsp";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@60000000 {
+		device_type = "memory";
+		reg = <0x60000000 0x80000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
new file mode 100644
index 000000000000..a2165aba3676
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65W.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-alamo.dtsi"
+
+/ {
+	model = "Cisco Meraki MX65W";
+	compatible = "meraki,mx65w", "brcm,bcm58625", "brcm,nsp";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@60000000 {
+		device_type = "memory";
+		reg = <0x60000000 0x80000000>;
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
