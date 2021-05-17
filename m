Return-Path: <SRS0=iJAY=KM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91058C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:35:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D956128E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22D956128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VVh9mjymM/kyXfQJiytACEXveJ5eUT4eutHC/jvCVOY=; b=Vt2NkV1lNRzH4+gwEhWnbYoPd
	gve3uwB5VyY4Jb2QmYvDwX9bbWQmFRwSMJX1w9IlAA6vUL37OlFjz1CwF6jTjtLcLkMboiEFkug7h
	S3clrh2+vK+S6+O+Yb4mvEg4VGjbyA+yLCTzssXGF3EQRDvttIOlHb6fzVc3AAPrqfiW/orpxVSFB
	Z6hwbvB394ogfM7wC9mBsTVN8ycJK/39s/yt6n0pmSISDrIXecEfzKwU2i22xdNwOWU6ZOVlH6/3d
	SpMIw48Eh6bEd4BhcN8UvNyG9EdaMx+H7OPI2s6aa9TqH3cy5997VW16B+/FHOXakjn3hCrJ0d7kJ
	SPqWvn7Ow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liizH-00FwuS-ER; Mon, 17 May 2021 19:33:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyW-00FwrE-Ff
 for linux-arm-kernel@desiato.infradead.org; Mon, 17 May 2021 19:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rpO3uokOqiPCm4WwzxXP4FgPuwUQkbWlx97bygCs6TE=; b=gIgnPzsPVKM/DBTvtsh2FqzMLA
 49R1kbUNZqxKxqKsFxpEVRLCYkWFezm7u9y1AHnZKZX+1C1YGJK0DIOqu+Tk5JXhK6CZ96Z4lOEH7
 BgVNkdbYFr1k6OFfSO6ZIrKn8nysTeXqovTigoMQaCXu+nUxrX/HM791FjaveB4KD+pu4fSDEV8d0
 myyv/wXzfQ9Xf5jqvaaINqqXqCfJD9TY2BfdemoPNBL1yZieJqTO9HM5dFLbyEG+Apd5hWUssrBEl
 Bt2bjW55JfLEv/ZyZv4PIwVnpgtcRih15ONAQBjQavI7M+Z0iqTykXK5XVFG7I1Ljm4lLIIotMrAU
 XlNI8Y7Q==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyT-00E5o9-Qn
 for linux-arm-kernel@lists.infradead.org; Mon, 17 May 2021 19:32:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id q5so7632329wrs.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 17 May 2021 12:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rpO3uokOqiPCm4WwzxXP4FgPuwUQkbWlx97bygCs6TE=;
 b=rV0rOUax1CAS9yX/C9BpXQgRVQ3xSi21tse0r9NlAHpECR1RNeTpenSOZeIIyVgIsB
 3sYSOhnzW5XwxGSYiZRLei2ZDL4lN1nxEFZEB51MRLPDtwTcX8mcU+ExGLnh7L/aUM6g
 UQ0th7gYDHW1YgavwjEJ2bWpUBmWzQ1Dt6N7LnswvQgbNmDqaucW2B47UMsxPFq1r1Qp
 tZHBTBhnWIWgFzTSYqQRbwAN8O6ttc94CWEtIJcwx5Ry8EzQWBhsbk3Z8Dk9VuKopZPO
 SwYJ5a4uR9Ro8abLx6zFvuBc5i2TAewpz2+RqgTyT3uewSZ2OjDO/NyFcjc2l6rOVYEV
 lx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rpO3uokOqiPCm4WwzxXP4FgPuwUQkbWlx97bygCs6TE=;
 b=pybrRBsMkjIZh8kGcGTWRFSkbUZ20g+MFxjpDwyXalG+piDBD1XSCgj4RvoNUwyLpx
 2PFoZ2uhM5r7R9dYdZpJeaQE24UFFoi90j9CnZXUWq8lHObgy8XMDELykB3ST1JY6Uja
 Cs4oyQxZLWnA78KkxhjQ5w3lg7JzW29cmGxKUlm4oXNzCG1TvaygYI5iD4VrIXA6rm9H
 NtsRMxRzn/dvWad6j0K/kYzX7smRIm94+DlQldC/KXL8YW5yS7eMcH2p5xDdQJtig39K
 ztjRGEC7rmdkkk85Oz+LhdlJ2hIplPOiFG6uBad+vBo9R4Ef7lziSAyZ/mx//gl2zxY4
 zcBw==
X-Gm-Message-State: AOAM532ZJgqdwzekkl2HGE/CZHA7eCeaR28nbav6HTwPehcNS/bEJo3r
 mVFl2icjqaRtQif1iyYUAGT6bw==
X-Google-Smtp-Source: ABdhPJxn1zwLPS2lH6ex3GLFfoO0jaVGCvdgNLe2LktnQOYgI69Mi1e412O7uCjd4UmHL5/zUULYHA==
X-Received: by 2002:adf:f212:: with SMTP id p18mr1506508wro.318.1621279940435; 
 Mon, 17 May 2021 12:32:20 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 12:32:20 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/5] ARM: gemini: add device tree for edimax NS2502
Date: Mon, 17 May 2021 19:32:04 +0000
Message-ID: <20210517193205.691147-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517193205.691147-1-clabbe@baylibre.com>
References: <20210517193205.691147-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_123221_887885_F511BB73 
X-CRM114-Status: GOOD (  16.21  )
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
Message-ID: <20210517193204.uGUga4972-CdAP1D4tO1s5FAXfYhRCc-fYj7I28GGIs@z>

The edimax NS2502 is a NAS box running a SL3516 SoC.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/Makefile          |   1 +
 arch/arm/boot/dts/gemini-ns2502.dts | 141 ++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 arch/arm/boot/dts/gemini-ns2502.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1754b562e0b9..bb30d13c9c60 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -216,6 +216,7 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
 	gemini-dlink-dir-685.dtb \
 	gemini-dlink-dns-313.dtb \
 	gemini-nas4220b.dtb \
+	gemini-ns2502.dtb \
 	gemini-rut1xx.dtb \
 	gemini-sl93512r.dtb \
 	gemini-sq201.dtb \
diff --git a/arch/arm/boot/dts/gemini-ns2502.dts b/arch/arm/boot/dts/gemini-ns2502.dts
new file mode 100644
index 000000000000..a23745dc20f4
--- /dev/null
+++ b/arch/arm/boot/dts/gemini-ns2502.dts
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Corentin Labbe <clabbe@baylibre.com>
+ * Device Tree file for Edimax NS 2502
+ */
+
+/dts-v1/;
+
+#include "gemini.dtsi"
+
+/ {
+	model = "Edimax NS-2502";
+	compatible = "edimax,ns-2502", "cortina,gemini";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@0 {
+		/* 128 MB */
+		device_type = "memory";
+		reg = <0x00000000 0x8000000>;
+	};
+
+	aliases {
+		mdio-gpio0 = &mdio0;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,19200n8";
+		stdout-path = &uart0;
+	};
+
+	mdio0: mdio {
+		compatible = "virtual,mdio-gpio";
+		gpios = <&gpio0 22 GPIO_ACTIVE_HIGH>, /* MDC */
+			<&gpio0 21 GPIO_ACTIVE_HIGH>; /* MDIO */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@1 {
+			reg = <1>;
+			device_type = "ethernet-phy";
+			/* We lack the knowledge of necessary GPIO to achieve
+			 * Gigabit
+			 */
+			max-speed = <100>;
+		};
+	};
+};
+
+&ethernet {
+	status = "okay";
+	ethernet-port@0 {
+		phy-mode = "rgmii";
+		phy-handle = <&phy0>;
+	};
+};
+
+&flash {
+	status = "okay";
+	/* 8MB of flash */
+	reg = <0x30000000 0x00800000>;
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "RedBoot";
+			reg = <0x00000000 0x00020000>;
+			read-only;
+		};
+		partition@20000 {
+			label = "kernel";
+			reg = <0x00020000 0x00700000>;
+		};
+		partition@720000 {
+			label = "VCTL";
+			reg = <0x00720000 0x00020000>;
+			read-only;
+		};
+		partition@740000 {
+			label = "CurConf";
+			reg = <0x00740000 0x000a0000>;
+			read-only;
+		};
+		partition@7e0000 {
+			label = "FIS";
+			reg = <0x007e0000 0x00010000>;
+			read-only;
+		};
+	};
+};
+
+&gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio0_default_pins>;
+};
+
+&ide0 {
+	status = "okay";
+};
+
+&ide1 {
+	status = "okay";
+};
+
+&sata {
+	cortina,gemini-ata-muxmode = <3>;
+	cortina,gemini-enable-sata-bridge;
+	status = "okay";
+};
+
+&syscon {
+	pinctrl {
+		/*
+		 * gpio0agrp cover line 0-4
+		 * gpio0bgrp cover line 5
+		 */
+		gpio0_default_pins: pinctrl-gpio0 {
+			    mux {
+				    function = "gpio0";
+				    groups = "gpio0agrp", "gpio0bgrp", "gpio0hgrp";
+			    };
+		    };
+		    pinctrl-gmii {
+			    mux {
+				    function = "gmii";
+				    groups = "gmii_gmac0_grp";
+			    };
+		    };
+	};
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
