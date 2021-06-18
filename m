Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B808FC48BDF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:58:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E55161260
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E55161260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTNWzymbdgJ2UeS7uzzlZbvNbN7bUBR92npcPoKTtE0=; b=tgNBPn4Rbwid7P
	NaJ0jWL3KrTSP9aUj28VmL05f3rjO0Owm++A813Jx2c3qH5X/DdstPAr/wcemlNuegd+p0VJ6wT1H
	cUqAixxJsgkJzaeJi6aL7BgAw5AE/42vLJcLBk4Fmv36os3CwXy9IUWiDLG3L56xvXrV3EhxUq5cW
	iWmawaJY0YWBdnn2fFmVSNcIGWAV9Hgf8gTq3bR2KiCi0Cu0swDFHQEr4s4GA4N9HoUAJillsrevY
	FhuDGam/lKw9eeb5e0iC/M2yaABaoIlFBd39ILs67ARpHCrfd/Eu/9wdKs284UHvBTBNr0UXXz8pj
	QY+Dg1gHj5dMCIJ5hxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLXP-00FVDl-Tn; Fri, 18 Jun 2021 20:56:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLWj-00FV7m-Ht
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 20:55:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id c84so6358449wme.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 13:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=feUBT/gVIbiawXPIzi36s14YtbtOT8rxLgi9aQ5Wia4=;
 b=G40ELh3tb5L95jSBi4aQBb7W/oirR7ymbKkQpFeyJyNcbtfsZHLSIM+T0zo3yw2p2u
 xjOIJDRKv2PvsK9fDYJP30kMUD4ekamGWU62vZGMNbP+IcJ0VmAdbsaawJbgTO/f4GTv
 JO80kKUFFpzN3bLM84rtfNr2s9QKpCP6B4Bj6rDcNbXs19XfEeTLOHXqSoQo4E/BCwS6
 YLdqfV9B3wfhaeJUjWiLxaLeAp4fzs9X8vZptt1+Sb5ZpiVZmwj1DdQtKwNgLMGgP3O4
 uYFOG9Ql3m5KWP6arjqcVhXdHBmuLz9mI32c/RLPaH+NmAU2CV7qI1cDcBk2pza5CPlJ
 Klag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=feUBT/gVIbiawXPIzi36s14YtbtOT8rxLgi9aQ5Wia4=;
 b=MxFiYhUzGr/oXzzSVSrdwlejq5gdK3Ji+rfC8e7e3G9pMuF2UOObtUaIxOihjE8wyi
 wA2cU/15fFj6g1+ycwitpGrNe0J9aEeAi69P2detbjtkeQ5t4cvfobQqfV2btNCTrSUg
 u0sctAxGdm8/xbLS3qG9sMXiq2LzxatbPmHaB7y5hnAjPrExS4L0oWGyaWcMpxuhF+aq
 t67i52MMORNKMD2rj1SuBvl6KE1QnT0X8/g5/pXnquuqIwB0fDpXPghN+S3Hf8kxHh9V
 h3CHsunfgwTIbtRl5+WrNE4c+Cdayc9tNtncVa7x8hvy4Ng7FjniDv7eFBXUqB8jJK2Q
 8IJg==
X-Gm-Message-State: AOAM532dXNHyiJNf/JsgDJP/aXuyNYzm7pyEFuVW+4S1x2POd/1PElpw
 Btr1CdOSOV8EqQgcqLVqYjqX5g==
X-Google-Smtp-Source: ABdhPJyhEWW14WBY1IPO6pc1amso4/8ll8hB9bhhjddIa1mHMUyh+7VkgGuUA7dzd4rpcvPirUpRqw==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr13337593wmj.63.1624049744043; 
 Fri, 18 Jun 2021 13:55:44 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:55:43 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 4/5] ARM: gemini: add device tree for edimax NS2502
Date: Fri, 18 Jun 2021 20:55:32 +0000
Message-ID: <20210618205533.1527384-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_135545_640752_1AFA13B4 
X-CRM114-Status: GOOD (  16.34  )
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
Message-ID: <20210618205532.9WY9nNBKp0kn7yrYYp2nGj3NHSnPFD7hACTjaYB9U2s@z>

The edimax NS2502 is a NAS box running a SL3516 SoC.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/Makefile          |   1 +
 arch/arm/boot/dts/gemini-ns2502.dts | 148 ++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 arch/arm/boot/dts/gemini-ns2502.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 863347b6b65e..806715f3266d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -217,6 +217,7 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
 	gemini-dlink-dir-685.dtb \
 	gemini-dlink-dns-313.dtb \
 	gemini-nas4220b.dtb \
+	gemini-ns2502.dtb \
 	gemini-rut1xx.dtb \
 	gemini-sl93512r.dtb \
 	gemini-sq201.dtb \
diff --git a/arch/arm/boot/dts/gemini-ns2502.dts b/arch/arm/boot/dts/gemini-ns2502.dts
new file mode 100644
index 000000000000..704abd212df5
--- /dev/null
+++ b/arch/arm/boot/dts/gemini-ns2502.dts
@@ -0,0 +1,148 @@
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
+	pinctrl-names = "enabled", "disabled";
+	pinctrl-0 = <&pflash_default_pins>;
+	pinctrl-1 = <&pflash_disabled_pins>;
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "RedBoot";
+			reg = <0x00000000 0x00020000>;
+		};
+		partition@20000 {
+			label = "kernel";
+			reg = <0x00020000 0x00700000>;
+		};
+		partition@720000 {
+			label = "VCTL";
+			reg = <0x00720000 0x00020000>;
+		};
+		partition@740000 {
+			label = "CurConf";
+			reg = <0x00740000 0x000a0000>;
+		};
+		partition@7e0000 {
+			label = "FIS";
+			reg = <0x007e0000 0x00010000>;
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
+		};
+		pflash_disabled_pins: pinctrl-pflash-disabled {
+			mux {
+				function = "gpio0";
+				groups = "gpio0ggrp", "gpio0igrp", "gpio0jgrp",
+					 "gpio0kgrp";
+			};
+		};
+		pinctrl-gmii {
+			mux {
+				function = "gmii";
+				groups = "gmii_gmac0_grp";
+				};
+		};
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
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
