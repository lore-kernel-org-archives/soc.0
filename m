Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51061C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0F064DDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0F064DDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SL8b6tRBsiCTfoQRnv8pIX6TSj/K3EMKdfBvo7eV0Ac=; b=HOzwZDtzkJEzIHDNASeSXcQQM
	JY2UYJcl1SdAhYR5CuORuSQd63cjUO3Jem3jaYhEoIYuY8gHEn9rXffyaHRfAqwksVHTvZwX40SIG
	4cXmw+qFDqar879vo2VgVpQoysgdo2oS4NvJHPervQpyTNESmNNzNeGuDTBKFXNvPernpNEKopGQS
	+e3qLvJAqaFybXAJnj0Y9qFnsxg/XsII5K3/EGk68XKInLtFw0NK46I2J240i/qd+GAo+Spo7vmAY
	TCB7rC7R5ePGjmA5ZRyDsDggSdZLlPt+Soc+ci46vPLdC8Ll81eCiX04TUjbB7o/5uOsqvAt8dTu3
	fD/4eMlHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lSO-0000Nb-P2; Thu, 04 Feb 2021 20:42:28 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lR8-00087p-0I
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:41:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id EBE1D4286C;
 Thu,  4 Feb 2021 20:41:05 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1) devicetree
Date: Fri,  5 Feb 2021 05:39:51 +0900
Message-ID: <20210204203951.52105-19-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154110_502509_35B1493C 
X-CRM114-Status: GOOD (  14.86  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204203951.3I0BOCXXWD_2z81PudnS-uucXRduMKMFohVsZ3d49c4@z>

This currently supports:

* SMP (via spin-tables)
* AIC IRQs
* Serial (with earlycon)
* Framebuffer

A number of properties are dynamic, and based on system firmware
decisions that vary from version to version. These are expected
to be filled in by the loader.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 MAINTAINERS                              |   1 +
 arch/arm64/boot/dts/Makefile             |   1 +
 arch/arm64/boot/dts/apple/Makefile       |   2 +
 arch/arm64/boot/dts/apple/apple-j274.dts | 143 +++++++++++++++++++++++
 4 files changed, 147 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/Makefile
 create mode 100644 arch/arm64/boot/dts/apple/apple-j274.dts

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a54ee5747d3..5481b5bc2ef7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1635,6 +1635,7 @@ C:	irc://chat.freenode.net/asahi-dev
 T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/AAPL.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/AAPL,aic.yaml
+F:	arch/arm64/boot/dts/AAPL/
 F:	drivers/irqchip/irq-apple-aic.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 9b1170658d60..64f055d94948 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -6,6 +6,7 @@ subdir-y += amazon
 subdir-y += amd
 subdir-y += amlogic
 subdir-y += apm
+subdir-y += apple
 subdir-y += arm
 subdir-y += bitmain
 subdir-y += broadcom
diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
new file mode 100644
index 000000000000..ec03c474efd4
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_APPLE) += apple-j274.dtb
diff --git a/arch/arm64/boot/dts/apple/apple-j274.dts b/arch/arm64/boot/dts/apple/apple-j274.dts
new file mode 100644
index 000000000000..238a1bcee066
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/apple-j274.dts
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2021 Hector Martin <marcan@marcan.st>
+ */
+
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/apple-aic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Apple Mac Mini M1 2020";
+	compatible = "AAPL,j274", "AAPL,m1", "AAPL,arm-platform";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		bootargs = "earlycon";
+		stdout-path = "serial0:1500000";
+
+		framebuffer0: framebuffer@0 {
+			compatible = "AAPL,simple-framebuffer", "simple-framebuffer";
+			reg = <0 0 0 0>; // To be filled by loader
+			// Format properties will be added by loader
+			status = "disabled";
+		};
+	};
+
+	memory@800000000 {
+		device_type = "memory";
+		reg = <0 0 0 0>; // To be filled by loader
+	};
+
+	aliases {
+		serial0 = &serial0;
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "AAPL,icestorm";
+			device_type = "cpu";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0>; // To be filled by loader
+		};
+		cpu1: cpu@1 {
+			compatible = "AAPL,icestorm";
+			device_type = "cpu";
+			reg = <0x0 0x1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0>; // To be filled by loader
+		};
+		cpu2: cpu@2 {
+			compatible = "AAPL,icestorm";
+			device_type = "cpu";
+			reg = <0x0 0x2>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0>; // To be filled by loader
+		};
+		cpu3: cpu@3 {
+			compatible = "AAPL,icestorm";
+			device_type = "cpu";
+			reg = <0x0 0x3>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0>; // To be filled by loader
+		};
+		cpu4: cpu@10100 {
+			compatible = "AAPL,firestorm";
+			device_type = "cpu";
+			reg = <0x0 0x10100>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0>; // To be filled by loader
+		};
+		cpu5: cpu@10101 {
+			compatible = "AAPL,firestorm";
+			device_type = "cpu";
+			reg = <0x0 0x10101>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0>; // To be filled by loader
+		};
+		cpu6: cpu@10102 {
+			compatible = "AAPL,firestorm";
+			device_type = "cpu";
+			reg = <0x0 0x10102>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0>; // To be filled by loader
+		};
+		cpu7: cpu@10103 {
+			compatible = "AAPL,firestorm";
+			device_type = "cpu";
+			reg = <0x0 0x10103>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0 0>; // To be filled by loader
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_FIQ 1 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_FIQ 0 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	clk24: clk24 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clk24";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aic: interrupt-controller@23b100000 {
+			compatible = "AAPL,m1-aic", "AAPL,aic";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x2 0x3b100000 0x0 0x8000>;
+		};
+
+		serial0: serial@235200000 {
+			compatible = "AAPL,s5l-uart";
+			reg = <0x2 0x35200000 0x0 0x1000>;
+			reg-io-width = <4>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk24>, <&clk24>;
+			clock-names = "uart", "clk_uart_baud0";
+		};
+
+	};
+};
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
