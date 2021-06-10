Return-Path: <SRS0=gFkl=LE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A25C48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:31:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD489613E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD489613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7yoRpck7IuCvMskBJR7SC0eNeSDAJvrIdYEBijBSXsQ=; b=AcBz7Wo1MS58fT
	wA45wfZ51MZn8lKIYB8Izisc5eVis54JcktNyciMfJ03HmS+f+AwFuuoN5rxwH6UxH49v1ZqIWsHD
	9LkrmkrMD6Bcese9PFO9jIW+hfh1+dnyYSjftAeFQtpUMNGXkgzP/MbSHfKuJ94neLWBQi8iahMzH
	uhrRaahJ7BnpNT40FhkPGjjZRpV4bsAecyO162akdZfKIAUUpBaIGf1uJeMpLfoC8LGJz9B6jjFle
	SmC+8BWEBi2fkUTEV81L/vX8nc9px6Mm95LhT8BVInQJyFl28JeEEXnsm1Bds5Ge+SSMxaveddO/u
	9FDopwaRvoQePZ8Ltf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrU6l-002tBC-Ks; Thu, 10 Jun 2021 23:29:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrU6e-002t8I-JR
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 23:29:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id m18so4042477wrv.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 16:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTpjcEscnkXt8biWria3TPVvbm38R/l/UTSx1WwHNQ4=;
 b=HV8O5Wx+mQNMN2vpuSzv6+t3TN3t8AVdOuLrs6e0MI3vI0yveOfPUCL09T29xrwxX/
 niGf6R3taOBFa8NYD4uEp0yNeNLCyMyzyYf6gKdaAGJ4EPvWR426NVveEtldotO7Nd91
 LKyfqy+Ribef0jOKTR61fp1aymO05HvpUYUqc/vJLoIcUeOpgTnL9Wzdxbw5d9PX4ebR
 wSN92PxI4lp2g4eseZu5R7VwHs+3zRQY8SxKzo4mNY2Z/KIs6psFnXmRKzbLaLkI3ao7
 h7uV6+I6mveGb0jP+TOEuP4Sp0nZKDE9vEHqI/5Cvy0U+lCuln3iwJSOL/Z6KSHqx+TZ
 4Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTpjcEscnkXt8biWria3TPVvbm38R/l/UTSx1WwHNQ4=;
 b=ESr2yc2hCyHp8QKjTxi8pf4afc29diOHbgjkmhmHi7rW/ZvEL28tlocKzEvubiqB9Y
 sZ0S6j/rnrkUUE2xpoDtuzIcXIaHR6hyOD9g5fCHtlVD6UHwOh6Xstgfr4JOzccnfzyf
 yl0F8qurDZOjEV8/VDvzm0LWhwdvzDvAmioXbnC9yY6kTo10REbRswe04Se2Ukwr7um3
 YhR+7VU8IyZNHtMMqIs8+czv0FZHBsPuTzVWy8vlULk4PD3/FRkpxhCwT0oHOuojAQNV
 IlTiZQiKObef/WOBHGM6fRMnqupC8CMlap0LKBQZo4nJxuWLYTMMBJwKgFYZeRaEREH7
 FzdA==
X-Gm-Message-State: AOAM5321276VQGsBKbauagsQ6na2cwUiSHKz6F8FjG2TQNtYG5iI83eg
 qY4101s6DOQpje9I+40p/cmHn20OhZ4=
X-Google-Smtp-Source: ABdhPJyCoU8FCEn23JKM5OCnln6DG5M5qDbzdTAbzlnFUMV2OTYKEdslyh579et4/sWhtyi1REg0Yw==
X-Received: by 2002:adf:de03:: with SMTP id b3mr788972wrm.15.1623367738500;
 Thu, 10 Jun 2021 16:28:58 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id f14sm9786849wmq.10.2021.06.10.16.28.57
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 10 Jun 2021 16:28:58 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/5] ARM: dts: NSP: Add DT files for Meraki MX64 series
Date: Fri, 11 Jun 2021 00:27:16 +0100
Message-ID: <20210610232727.1383117-5-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610232727.1383117-1-mnhagan88@gmail.com>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_162900_680503_B9D5B99A 
X-CRM114-Status: GOOD (  17.28  )
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
Message-ID: <20210610232716.NXlGzZm3hzuT14yRGjZhCHWGMFqwPB5gtKMBlPEPcR4@z>

MX64 Hardware info:
  - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
  - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
  - Storage: 1 GB (Micron MT29F8G08ABACA)
  - Networking: BCM58625 internal switch (5x 1GbE ports)
  - USB: 1x USB2.0
  - Serial: Internal header

This patch adds the Meraki MX64 series. Since some devices make use of
the older A0 SoC, changes need to be made to accommodate this device,
including removal of dma-coherent and change in the secondary-cpu
address. The MX64W devices have 2x Broadcom BCM43520KMLG on the PCI bus.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 .../boot/dts/bcm958625-meraki-kingpin.dtsi    | 131 ++++++++++++++++++
 .../arm/boot/dts/bcm958625-meraki-mx64-a0.dts |  45 ++++++
 arch/arm/boot/dts/bcm958625-meraki-mx64.dts   |  15 ++
 .../boot/dts/bcm958625-meraki-mx64w-a0.dts    |  55 ++++++++
 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts  |  23 +++
 5 files changed, 269 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx64w.dts

diff --git a/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
new file mode 100644
index 000000000000..8c4834f3496b
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-kingpin.dtsi
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 series (Kingpin).
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm958625-meraki-mx6x-common.dtsi"
+
+#include <dt-bindings/input/input.h>
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		orange_power {
+			label = "orange:power";
+			gpios = <&gpioa 0 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		lan1_right {
+			label = "green:lan1-right";
+			gpios = <&gpioa 18 GPIO_ACTIVE_LOW>;
+		};
+
+		lan1_left {
+			label = "green:lan1-left";
+			gpios = <&gpioa 19 GPIO_ACTIVE_LOW>;
+		};
+
+		lan2_right {
+			label = "green:lan2-right";
+			gpios = <&gpioa 20 GPIO_ACTIVE_LOW>;
+		};
+
+		lan2_left {
+			label = "green:lan2-left";
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		lan3_right {
+			label = "green:lan3-right";
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		lan3_left {
+			label = "green:lan3-left";
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		lan4_right {
+			label = "green:lan4-right";
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
+		};
+
+		lan4_left {
+			label = "green:lan4-left";
+			gpios = <&gpioa 28 GPIO_ACTIVE_LOW>;
+		};
+
+		wan_right {
+			label = "green:wan-right";
+			gpios = <&gpioa 29 GPIO_ACTIVE_LOW>;
+		};
+
+		wan_left {
+			label = "green:wan-left";
+			gpios = <&gpioa 30 GPIO_ACTIVE_LOW>;
+		};
+
+		white_status {
+			label = "white:status";
+			gpios = <&gpioa 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
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
+			label = "cpu";
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
index 000000000000..aed9eb9fccd7
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64-a0.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 with A0 SoC.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64(A0)";
+	compatible = "meraki,mx64-a0", "brcm,bcm58625", "brcm,nsp";
+};
+
+&cpu1 {
+	secondary-boot-reg = <0xffff042c>;
+};
+
+&L2 {
+	/delete-property/ arm,io-coherent;
+	/delete-property/ prefetch-data;
+	/delete-property/ prefetch-instr;
+};
+
+&amac2 {
+	/delete-property/ dma-coherent;
+};
+
+&mailbox {
+	/delete-property/ dma-coherent;
+};
+
+&ehci0 {
+	/delete-property/ dma-coherent;
+};
+
+&ohci0 {
+	/delete-property/ dma-coherent;
+};
+
+&i2c0 {
+	/delete-property/ dma-coherent;
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64.dts
new file mode 100644
index 000000000000..fe787fd7d660
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 with B0+ SoC.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64";
+	compatible = "meraki,mx64", "brcm,bcm58625", "brcm,nsp";
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
new file mode 100644
index 000000000000..b7d88c542943
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64w-a0.dts
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W with A0 SoC.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64(A0)";
+	compatible = "meraki,mx64-a0", "brcm,bcm58625", "brcm,nsp";
+};
+
+&cpu1 {
+	secondary-boot-reg = <0xffff042c>;
+};
+
+&L2 {
+	/delete-property/ arm,io-coherent;
+	/delete-property/ prefetch-data;
+	/delete-property/ prefetch-instr;
+};
+
+&amac2 {
+	/delete-property/ dma-coherent;
+};
+
+&mailbox {
+	/delete-property/ dma-coherent;
+};
+
+&ehci0 {
+	/delete-property/ dma-coherent;
+};
+
+&ohci0 {
+	/delete-property/ dma-coherent;
+};
+
+&i2c0 {
+	/delete-property/ dma-coherent;
+};
+
+&pcie0 {
+	/delete-property/ dma-coherent;
+	status = "okay";
+};
+
+&pcie1 {
+	/delete-property/ dma-coherent;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
new file mode 100644
index 000000000000..aa29c96f2871
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx64w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W with B0+ SoC.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-kingpin.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64W";
+	compatible = "meraki,mx64w", "brcm,bcm58625", "brcm,nsp";
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
