Return-Path: <SRS0=VOD1=LH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27840C48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 10:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAAB161261
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jun 2021 10:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAAB161261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqwrUKA7IcocJsvHj67dd83sN9MofMTUcvNJ0gFOMCY=; b=UN7/1PZRz2a7W8
	tn75AZLeCvVrVwGXLo3kVx0suAiUEUx7y9hZx+qkkWJZqB4lmFFdwycM+w5bfISpL375LpHuWS+QF
	lF06JOTn7LpI5enzJWUJpsgQ8xTsGRfncpVxdsH1+IBVydsrggCNgyGskrYzZeI7Q8LIE4DISzBD4
	CxQqF8Ok24Lr2wbQVBFTnyQVOr5Y4UAdR0zBs39WkdK+67fjhdTmo3eJIX8nOJcyjGlXAb2DZWVRW
	30FYhHmsC1I35SXkE5L9XFS5Qxx0G5I3x0hwoYungR4ZyQN6ELsiCF0SRVLseSS6fyHtxmRkmbCQi
	buAnoI05GRm2hLyDEuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsNCt-00ACF0-Dh; Sun, 13 Jun 2021 10:19:07 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsNCm-00ACDJ-Bl
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Jun 2021 10:19:01 +0000
Received: by mail-wr1-f42.google.com with SMTP id y7so11001065wrh.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 13 Jun 2021 03:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sROUK6Dva1JQuoPMs/jXitnbxB+zZqBPPto4386z0vs=;
 b=iEgzLk4om3CmXjGeHduPgS2tuE9n3w+7odBDhtldN2Yh0eUUEKkZvWwgig1b8zBRSi
 mDrO76P+6hQPZj2A7hcA6Jg55sbL/IiWjRaaaS7PaLMI8ODUjLHMkr+Vyi8PcRYutstv
 68bgXhbnSd0336Pu4qeGJ434ZUct7+HUYxHlDnhmDqEu367sjQru1cmps7HNSawkUx2A
 OZcIdlAfMElRM6yHaIXfqS9nAYb3g7otdd7mmXF+0iqZMxF7CHzUYs/rnmhxAVYgz8H4
 ZKsmTXusnS4JOAhw5y1Wve0Ad5gGiR9UuluLr4RapqmxMaa8asfxGGKzK1WllkNLmEjA
 ix3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sROUK6Dva1JQuoPMs/jXitnbxB+zZqBPPto4386z0vs=;
 b=Goq2VIGdGeS9m3gmpywIaECdo5B2vLFjhwhKZcDCDg/SeykQYmB221CAYQq7OusTwr
 q3K+qLV5DEodb/hSjsHsTEYC6pEfRji+osRrBW/3yTR9/XyX1aL0UvWCfVJ4MhEsVmwq
 ak+82DY92VaMbkgUxWX3Byg9FdV2WSwong8PnWPzZa9tbwRaLJIVg+jVuPrIoyA1mMDe
 oMwp6MBiQX60gmP3221eSui9ApnbQ5M+7gyHJs92sgcdsIboFGkOO2hWazTWLlThmp2h
 O61VigYhahVa6rm+W+Gc6z2Iejlq13OaCVDb+BiNcPhz8YR7bnyxOvpxrix1OqC7Aas6
 tMIA==
X-Gm-Message-State: AOAM5302NSxpOIqO6H6kzx//o716M6v/kBPywV3AWBHlDyOHn2uLlMY4
 8khEC/emBpdJPw7atBUXno9ZWl1ndLQ=
X-Google-Smtp-Source: ABdhPJxFcpzxxe157MZ8aKlQCWnikrDr1kv2KTXlwrxueiNotMzM77Tc4PNfKmNDW+nWzts8vNjvWQ==
X-Received: by 2002:adf:cf02:: with SMTP id o2mr13021764wrj.365.1623579478974; 
 Sun, 13 Jun 2021 03:17:58 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
 by smtp.gmail.com with ESMTPSA id j7sm13157035wrm.93.2021.06.13.03.17.58
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sun, 13 Jun 2021 03:17:58 -0700 (PDT)
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
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/4] ARM: dts: NSP: Add common bindings for MX64/MX65
Date: Sun, 13 Jun 2021 11:16:45 +0100
Message-ID: <20210613101658.3242777-2-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210613101658.3242777-1-mnhagan88@gmail.com>
References: <20210613101658.3242777-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_031900_426992_FD8EB5AA 
X-CRM114-Status: GOOD (  15.32  )
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
Message-ID: <20210613101645.C7d_UcandaySWKZ-YPBqKlrG4T23YA-uLKmg2PEKRzI@z>

These bindings are required for all Meraki MX64/MX65 devices. These
common bindings include memory (2GB), PWM LEDs, AMAC, I2C (AT24), NAND
partitions, EHCI, OHCI and pinctrl.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 .../dts/bcm958625-meraki-mx6x-common.dtsi     | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi

diff --git a/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
new file mode 100644
index 000000000000..91ab586209f1
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-meraki-mx6x-common.dtsi
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Common Bindings for Cisco Meraki MX64 (Kingpin) and MX65 (Alamo) devices.
+ *
+ * Copyright (C) 2020-2021 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+#include "bcm-nsp.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x60000000 0x80000000>;
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led-1 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_RED>;
+			pwms = <&pwm 1 50000>;
+			max-brightness = <255>;
+		};
+
+		led-2 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			pwms = <&pwm 2 50000>;
+			max-brightness = <255>;
+		};
+
+		led-3 {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_BLUE>;
+			pwms = <&pwm 3 50000>;
+			max-brightness = <255>;
+		};
+	};
+};
+
+&amac2 {
+	status = "okay";
+};
+
+&ccbtimer0 {
+        status = "okay";
+};
+
+&ehci0 {
+        status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+	at24@50 {
+		compatible = "atmel,24c64";
+		pagesize = <32>;
+		reg = <0x50>;
+	};
+};
+
+&L2 {
+        arm,io-coherent;
+        prefetch-data = <1>;
+        prefetch-instr = <1>;
+};
+
+&nand {
+	nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-on-flash-bbt;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		nand-ecc-strength = <24>;
+		nand-ecc-step-size = <1024>;
+
+		brcm,nand-oob-sector-size = <27>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0 0x80000>;
+			read-only;
+		};
+
+		partition@80000 {
+			label = "shmoo";
+			reg = <0x80000 0x80000>;
+			read-only;
+		};
+
+		partition@100000 {
+			label = "bootkernel1";
+			reg = <0x100000 0x300000>;
+		};
+
+		partition@400000 {
+			label = "nvram";
+			reg = <0x400000 0x100000>;
+		};
+
+		partition@500000 {
+			label = "bootkernel2";
+			reg = <0x500000 0x300000>;
+		};
+
+		partition@800000 {
+			label = "ubi";
+			reg = <0x800000 0x3f700000>;
+		};
+	};
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_leds>;
+
+	pwm_leds: pwm_leds {
+		function = "pwm";
+		groups = "pwm1_grp", "pwm2_grp", "pwm3_grp";
+	};
+};
+
+&pwm {
+	status = "okay";
+	#pwm-cells = <2>;
+};
+
+&uart0 {
+        clock-frequency = <62500000>;
+        status = "okay";
+};
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
