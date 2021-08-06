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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E735C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C75216105A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C75216105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAKmYT4yDE1YVF3RNUsTtziycBkNZlyjN2XJ9GyF8U4=; b=kwVGOEupYaGm3E
	YOdy+OB5MZFeoqJS7z5sAe6jBpM+NfAFmVdIjmivPDepTp0nbFvY7+AGQ3KAlt6+dp6Y0OVOTIrxc
	YeFSZclFIeA6bW5sbrvEKjilTJDeEnd5/tbMCtYUh6oBXMWzIMRvnXMDjx6WGIxhoH08snva+hyeI
	VRfCQKQHrBZToHv/dlb2iNcSPT5TVbzDF77OHR7FLplZHlRedDlurMaGhDqYsvAV6SxbeqrElx4nX
	hNNUFeNT70+X/QoPlM3XwP7xd3qF8/+3rP6sG9XXKVUZCTr2oeiDvoQWvYFMqmlxA6V2Xgcx94W1t
	/JvGajCf/6KM+Tt+YMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6in-00DWrN-W5; Fri, 06 Aug 2021 20:45:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6ie-00DWoH-9K
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 20:45:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o11so218895wms.0
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 06 Aug 2021 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOx7j++6Cp3ZMkgpB4hUIoWCJI1orV4QpoQskXg5NHA=;
 b=vM/g+rVd6k2YusKWuyOxNVk1s3Ta0JMlhwTFZfDzEKwyy56lgwlVEcdZ7kISuSCCDg
 lOx3Ju7xOnL+4fL/UykdRXFsMCq7ts+XIuVtfOAlWgmN+ey6WgyWoL2zUZCGhMp++NyB
 5fSNLhamGYzsDOT6YVr+W1tiYYlU9wKpc3uagj0IAUKFDCG+34auqHv+o3y/STgDuXx4
 ZACKolh7aVM0z1MGssjezYFPs8ApUD/p9InYJMeGjHIPE59OelrlWy2UVXtPPgHIeGKM
 sYDtMFfemW5P0ABpTgLd+uFknGh5qWDMZ+h72nkQog1NYc69xhSnS/bjOreWfp/MQUe6
 Svlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOx7j++6Cp3ZMkgpB4hUIoWCJI1orV4QpoQskXg5NHA=;
 b=SIWcUGbP2Hq6CwTh+P9qmfvmr/Iu9OVZs4YvEyFOWyjV8BeyVhvkv5GqV0LejiHlVE
 m1ytNzEgvbJKxsEQBzo/7fdEaOie1xAxZJpByqPTojRXuqfDuQVmNqqNVulfmTN7rfLC
 6wGNk/pSR8zoy/xSvjWC/l9aRFnSij8XH/pvTNSYt4Sm49fIw/UpmnZKNSsgUV/+cpNb
 oWNvPQSi5xnct1E98QEAZODGkhgF/WduBZE2W+nVbErWq4enSoVotckUYcjA9hrA4+x8
 ZmDz+tK8zuGuDuHqRfPswFQRoQvQuE+PNLR5SFDil8zCcNW9kgqhce+mgsSDi7i+bNhy
 6OTg==
X-Gm-Message-State: AOAM531BntiR7JciBJdXrFLZhYLlJXO+5xE0kPJc0ZEt/Jtpcf089Si7
 lp0nqptOZQ7zaqoeINOyX3uANMUbc2g=
X-Google-Smtp-Source: ABdhPJx3bE4VVXPbIY9XejeVBeLbJqF87i9h7PBSDVq7cd8hZA6Sbn82rHceH7QYN5Ch6Jg2SNKHkQ==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr22064759wme.87.1628282726516; 
 Fri, 06 Aug 2021 13:45:26 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id h9sm10744827wrw.38.2021.08.06.13.45.25
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 06 Aug 2021 13:45:26 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/5] ARM: dts: NSP: Add DT files for Meraki MX64 series
Date: Fri,  6 Aug 2021 21:44:34 +0100
Message-ID: <20210806204446.2981299-4-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_134528_413758_8405E244 
X-CRM114-Status: GOOD (  18.66  )
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
Message-ID: <20210806204434.dr1axQrN2iHzm_YbYQaiE3BVw207L6GxZWYZWFx45I4@z>

MX64 & MX64W Hardware info:
  - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
  - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
  - Storage: 1 GB (Micron MT29F8G08ABACA)
  - Networking: BCM58625 internal switch (5x 1GbE ports)
  - USB: 1x USB2.0
  - Serial: Internal header
  - WLAN(MX64W only): 2x Broadcom BCM43520KMLG on the PCI bus

This patch adds the Meraki MX64 series-specific bindings. Since some
devices make use of the older A0 SoC, changes need to be made to
accommodate this case, including removal of coherency options and
modification to the secondary-boot-reg.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |   4 +
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 163 ++++++++++++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  25 +++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  24 +++
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  33 ++++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  32 ++++
 6 files changed, 281 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 863347b6b65e..17f7bdab50ef 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -155,6 +155,10 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
 	bcm958525xmc.dtb \
 	bcm958622hr.dtb \
 	bcm958623hr.dtb \
+	bcm958625-meraki-mx64.dtb \
+	bcm958625-meraki-mx64-a0.dtb \
+	bcm958625-meraki-mx64w.dtb \
+	bcm958625-meraki-mx64w-a0.dtb \
 	bcm958625hr.dtb \
 	bcm988312hr.dtb \
 	bcm958625k.dtb
diff --git a/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
new file mode 100644
index 000000000000..7c487c74fd10
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 series (Kingpin).
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm958625-meraki-mx6x-common.dtsi"
+
+/ {
+
+	keys {
+		compatible = "gpio-keys-polled";
+		autorepeat;
+		poll-interval = <20>;
+
+		reset {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpioa 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			/* green:lan1-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <0>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 19 GPIO_ACTIVE_LOW>;
+		};
+
+		led-1 {
+			/* green:lan1-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 18 GPIO_ACTIVE_LOW>;
+		};
+
+		led-2 {
+			/* green:lan2-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		led-3 {
+			/* green:lan2-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <3>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 20 GPIO_ACTIVE_LOW>;
+		};
+
+		led-4 {
+			/* green:lan3-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		led-5 {
+			/* green:lan3-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <5>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		led-6 {
+			/* green:lan4-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <6>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 28 GPIO_ACTIVE_LOW>;
+		};
+
+		led-7 {
+			/* green:lan4-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <7>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
+		};
+
+		led-8 {
+			/* green:wan-left */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <8>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 30 GPIO_ACTIVE_LOW>;
+		};
+
+		led-9 {
+			/* green:wan-right */
+			function = LED_FUNCTION_ACTIVITY;
+			function-enumerator = <9>;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioa 29 GPIO_ACTIVE_LOW>;
+		};
+
+		led-a {
+			/* amber:power */
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_AMBER>;
+			gpios = <&gpioa 0 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-b {
+			/* white:status */
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&gpioa 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&srab {
+	compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+			reg = <0>;
+		};
+
+		port@1 {
+			label = "lan2";
+			reg = <1>;
+		};
+
+		port@2 {
+			label = "lan3";
+			reg = <2>;
+		};
+
+		port@3 {
+			label = "lan4";
+			reg = <3>;
+		};
+
+		port@4 {
+			label = "wan";
+			reg = <4>;
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
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
new file mode 100644
index 000000000000..9944566c1195
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 with A0 SoC.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+#include "bcm-nsp-ax.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64(A0)";
+	compatible = "meraki,mx64-a0", "brcm,bcm58625", "brcm,nsp";
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
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64.dts
new file mode 100644
index 000000000000..06939438e874
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 with B0+ SoC.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64";
+	compatible = "meraki,mx64", "brcm,bcm58625", "brcm,nsp";
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
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
new file mode 100644
index 000000000000..112fddb1eed8
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W with A0 SoC.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+#include "bcm-nsp-ax.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64W(A0)";
+	compatible = "meraki,mx64w-a0", "brcm,bcm58625", "brcm,nsp";
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
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
new file mode 100644
index 000000000000..de2e367c3e78
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W with B0+ SoC.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64W";
+	compatible = "meraki,mx64w", "brcm,bcm58625", "brcm,nsp";
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
