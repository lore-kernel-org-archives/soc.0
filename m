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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23266C48BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:32:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C412E613DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jun 2021 23:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C412E613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vCShGdA2Y9eiibTWaDwGHjm2vL6GtGkkH9ce45iNOQ=; b=wG1Pau8OQbAVHE
	ArIEBuSUjKk4U59GvfwbJ8DPVH/5WAnFYQZIJS21PjJ9C8ES5yfw1AHBxRq7VEuDIzEr+vGDzrGxW
	7n1qeT0A5sDl3qHLdmISl2N4JITsRxv2x0bzt/GzTV1FqP7C16L56LS7OZDYJBFJjtD5vEPakaVLi
	6LAVxvGdWRXxC8o0IpV98/V3MtHjD/lV0I/+eBAHXp6crTrv4l+pZ4sGBJS3SaEw2+eBhaxhIRiNA
	bPyKkzGTX9ZuUvYKbcu7yyBbNi9+ug3IYgWcPkSrwZnWzgBOhZ3Bj6KsDfhIjzneTEN84vV5Ju6vR
	Jd7s5M5qvX2dstAXl90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrU8A-002toA-0W; Thu, 10 Jun 2021 23:30:35 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrU7n-002tes-Ns
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Jun 2021 23:30:13 +0000
Received: by mail-wr1-f45.google.com with SMTP id r9so4025511wrz.10
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Jun 2021 16:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HhcSQy57Xk+molyTSgrm3dx5SrUlr/2mzbjEv/WNMOU=;
 b=jpnPaLg60jW07YzzHu0ChAhdSW5p348xAPpzJKBpHWzR4USG4MQxJD0GW2OGPTxp4q
 mktJnQp6hB2S5FttzxSrRVK6VFiPry8axeMQwF+st8FKHA9UxiEE7oLgGHgEvr4ZsAsS
 l/KFjye6H47nCGWIig+sQj5P4q/ZzJIqqJPTyMyKUhw4UIFB3ReobZTBbLu0YvGYSV0g
 iT6GQF7KNzlKXQT1o1bT2j77C0fFkevKJAqDNiSvnPYIuORExrrowxt4Qd4lnIkJXTaB
 s2efglSaUwdBnCmVOxMfHTO2W/ioZrkY3yg83DpYn25SoKHbAIqyUjCetIf71T8fsTrm
 FoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HhcSQy57Xk+molyTSgrm3dx5SrUlr/2mzbjEv/WNMOU=;
 b=cV/iWXSe71UrajFObT65h6pfPUQxftZ3aiGudaeBRWs96XQRhbdSO9FKyB4nM39xez
 QClFxzykb2FUtMrxipBaMOdoaz0dX8Utz1HHK3dQMHALL9MIH4mRpVQ6OUH+EgIwfjpu
 N+MgBVI2HeuGndPqWCsE0MUiMUA3RX8ZIiyMKjvVJQS048vsw+GmkssHsUzirDzFLknJ
 F4uH4kOM5Mu9fXr8wBHRI8xG45b8om0ko+AhVuML5W7vjWgpdHwNYsyyTEqHO8CQFlzB
 qOowJXtR7+/rInE2QfkMOKzSpGEAECMwmWPRIQAFgon2MFs1PZY63/gCwanjlISwI2wJ
 USow==
X-Gm-Message-State: AOAM532Q5Ccp1HMeS0n9O1aEj3I++4iCXeyKp3tR1XCIrVUn3VQ7/2tk
 hK6w7Vz8ZHMhESAnaACjgdj0kzAlPto=
X-Google-Smtp-Source: ABdhPJwoti1dul8w+JOC/xKhLILahBFZgQncf7h90KOztRCshJATWa5qRQ6fZ/ywaE3tcbDmwGwJow==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr793033wru.77.1623367749540;
 Thu, 10 Jun 2021 16:29:09 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id 31sm5561644wrc.96.2021.06.10.16.29.08
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 10 Jun 2021 16:29:09 -0700 (PDT)
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sam Ravnborg <sam@ravnborg.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/5] ARM: dts: NSP: Add DT files for Meraki MX65 series
Date: Fri, 11 Jun 2021 00:27:17 +0100
Message-ID: <20210610232727.1383117-6-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610232727.1383117-1-mnhagan88@gmail.com>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_163011_839475_2CCC3FB9 
X-CRM114-Status: GOOD (  16.01  )
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
Message-ID: <20210610232717.r-ZQnw4AVo_M_LEtXRxdZx1RBOm6fOV7fNVAW2jPoI4@z>

MX65 Hardware info:
  - CPU: Broadcom BCM58625 Cortex A9 @ 1200Mhz
  - RAM: 2 GB (4 x 4Gb SK Hynix H5TC4G83CFR)
  - Storage: 1 GB (Micron MT29F8G08ABACA)
  - Networking: BCM58625 switch (2x 1GbE ports, used for WAN ports 1 & 2)
    2x Qualcomm QCA8337 switches (10x 1GbE ports, used for LAN ports 3-12)
  - PSE: Broadcom BCM59111KMLG connected to LAN ports 11 & 12
  - USB: 1x USB2.0
  - Serial: Internal header

As with the MX64, the MX65 has 2x Broadcom BCM43520KMLG on the PCI bus.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi | 298 ++++++++++++++++++
 arch/arm/boot/dts/bcm958625-meraki-mx65.dts   |  15 +
 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts  |  23 ++
 3 files changed, 336 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx65w.dts

diff --git a/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi b/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
new file mode 100644
index 000000000000..0ff78fb89b6d
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-alamo.dtsi
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65 series (Alamo).
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm958625-meraki-mx6x-common.dtsi"
+
+#include <dt-bindings/input/input.h>
+
+/ {
+	aliases {
+		mdio-mux-mmio = &mdiomux0;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		orange_power {
+			label = "orange:power";
+			gpios = <&gpioa 3 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		wan1_right {
+			label = "green:wan1-right";
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		wan1_left {
+			label = "green:wan1-left";
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		wan2_right {
+			label = "green:wan2-right";
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		wan2_left {
+			label = "green:wan2-left";
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
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
+			gpios = <&gpioa 8 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	mdio: mdio@18032000 {
+		compatible = "brcm,iproc-mdio";
+		reg = <0x18032000 0x8>;
+		#size-cells = <0>;
+		#address-cells = <1>;
+	};
+
+	mdiomux0: mdio-mux {
+		compatible = "mdio-mux-mmioreg";
+		reg = <0x18032000 0x4>;
+		mux-mask = <0x200>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		mdio-parent-bus = <&mdio>;
+
+		mdio_ext: mdio@200 {
+			reg = <0x200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x10>;
+				dsa,member = <1 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						label = "cpu";
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x10>;
+				dsa,member = <2 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						label = "cpu";
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
+			label = "cpu";
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
index 000000000000..aec86c3a4d05
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx65.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-alamo.dtsi"
+
+/ {
+	model = "Cisco Meraki MX65";
+	compatible = "meraki,mx65", "brcm,bcm58625", "brcm,nsp";
+};
diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
new file mode 100644
index 000000000000..0045a33055c1
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx65w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65W.
+ *
+ * Copyright (C) 2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-meraki-mx65x.dtsi"
+
+/ {
+	model = "Cisco Meraki MX65W";
+	compatible = "meraki,mx65w", "brcm,bcm58625", "brcm,nsp";
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
