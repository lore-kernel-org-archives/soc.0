Return-Path: <SRS0=+aDx=N5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B000C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Sep 2021 10:30:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A267610F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Sep 2021 10:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A267610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uXyvBjOGy7Z8cCblAZxmD+wyHpZvOvDgDocMl7DZA0=; b=UlxROmK3kgCpZM
	WkfxnGS1disHEPiy3Z8My1ZsmjhrvjoheyI5mbNdPWtznqfg3YiwM4KjckDyFkjnPOILo3QAChOfq
	QunSnPCksGykC/HdfJYU1NL6XoXjOqgYXtOdB2ADcdeThKh7ccW0/m4IzlfoK/r3uLYDJ0SwZ8/bV
	WJ02pQJCj6fJW/8loSjs0aNnH4zXTI+Yiiam7kjaBRDDIkUgLH4iWgnV5HcdBh897FRDRJTEEOV65
	NAuTcvwUTtQ70y42dojCDXeEBbC7fPH08dq/rq6PwDtkRQz6Le2FlMU9foD3jkYI4wJfNDzMwWhOA
	67nF288F1nAzypDuFUiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNYKl-003N7X-Pb; Tue, 07 Sep 2021 10:28:07 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNYKQ-003N21-JH
 for linux-arm-kernel@lists.infradead.org; Tue, 07 Sep 2021 10:27:49 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1mNYKP-00CH1K-0X
 for linux-arm-kernel@lists.infradead.org; Tue, 07 Sep 2021 12:27:45 +0200
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
 by yawp.biot.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1mNYKI-00CGxw-D7; Tue, 07 Sep 2021 12:27:38 +0200
Received: from bert by sumner.biot.com with local (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1mNYKH-000CPY-UC; Tue, 07 Sep 2021 12:27:37 +0200
From: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Bert Vermeulen <bert@biot.com>
Subject: [PATCH v2 3/5] ARM: dts: Add basic support for Airoha EN7523
Date: Tue,  7 Sep 2021 12:27:20 +0200
Message-ID: <20210907102722.47543-4-bert@biot.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907102722.47543-1-bert@biot.com>
References: <20210907102722.47543-1-bert@biot.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_032746_683464_DB62E772 
X-CRM114-Status: GOOD (  15.77  )
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
Message-ID: <20210907102720.CVvxdIguwHnXPjo9lF3ydnfblSHdCXHy-NPpAyVTGxQ@z>

From: John Crispin <john@phrozen.org>

Add basic support for Airoha EN7523, enough for booting to console.

The UART is basically 8250-compatible, except for the clock selection.
A clock-frequency value is synthesized to get this to run at 115200 bps.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Bert Vermeulen <bert@biot.com>
---
 arch/arm/boot/dts/Makefile       |   2 +
 arch/arm/boot/dts/en7523-evb.dts |  26 +++++++
 arch/arm/boot/dts/en7523.dtsi    | 114 +++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 arch/arm/boot/dts/en7523-evb.dts
 create mode 100644 arch/arm/boot/dts/en7523.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 863347b6b65e..3525ace2d2e0 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -174,6 +174,8 @@ dtb-$(CONFIG_ARCH_DAVINCI) += \
 	da850-lego-ev3.dtb
 dtb-$(CONFIG_ARCH_DIGICOLOR) += \
 	cx92755_equinox.dtb
+dtb-$(CONFIG_ARCH_AIROHA) += \
+	en7523-evb.dtb
 dtb-$(CONFIG_ARCH_EXYNOS3) += \
 	exynos3250-artik5-eval.dtb \
 	exynos3250-monk.dtb \
diff --git a/arch/arm/boot/dts/en7523-evb.dts b/arch/arm/boot/dts/en7523-evb.dts
new file mode 100644
index 000000000000..fa595b97bdd8
--- /dev/null
+++ b/arch/arm/boot/dts/en7523-evb.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+/* Bootloader installs ATF here */
+/memreserve/ 0x80000000 0x80000;
+
+#include "en7523.dtsi"
+
+/ {
+	model = "Airoha EN7523 Evaluation Board";
+	compatible = "airoha,en7523-evb", "airoha,en7523";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		bootargs = "earlycon=uart8250,mmio32,0x1fbf0000 console=ttyS0,115200";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
new file mode 100644
index 000000000000..034bd1de2cd6
--- /dev/null
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		npu_binary@84000000 {
+			no-map;
+			reg = <0x84000000 0xA00000>;
+		};
+
+		npu_flag@84B0000 {
+			no-map;
+			reg = <0x84B00000 0x100000>;
+		};
+
+		npu_pkt@85000000 {
+			no-map;
+			reg = <0x85000000 0x1A00000>;
+		};
+
+		npu_phyaddr@86B00000 {
+			no-map;
+			reg = <0x86B00000 0x100000>;
+		};
+
+		npu_rxdesc@86D00000 {
+			no-map;
+			reg = <0x86D00000 0x100000>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			clock-frequency = <80000000>;
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			clock-frequency = <80000000>;
+			next-level-cache = <&L2_0>;
+		};
+
+		L2_0: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	gic: interrupt-controller@9000000 {
+		compatible = "arm,gic-v3";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x09000000 0x20000>, <0x09080000 0x80000>;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <25000000>;
+	};
+
+	uart1: serial@1fbf0000 {
+		compatible = "ns8250";
+		reg = <0x1fbf0000 0x30>;
+		reg-io-width = <4>;
+		reg-shift = <2>;
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+		clock-frequency = <1843200>;
+		status = "okay";
+	};
+};
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
