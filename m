Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E83C48BE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74C66610C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74C66610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXMpoxd9iJwRnL19XCWylP4SIvi3hhxB6ALzfRN/jy4=; b=cBdZXv+kkFGOj8
	CHy7PyJ4BMKeCRlC38i0wOwgsj/q4eS4obrx8jDiIAWYJx8skQXr+XVZxXs7gXe8I5oe+TiecNRBF
	l6JHjJs/unVBXtOZzP6dRY9uwLzehv9uH6am6aUDnAUK3CJgkdjS8Z2jP9Mgfej8TxRJgYpY5/vyN
	rTmuMqlE2thq7mPtXc6aTtgVB6SZa3Za8xVKBtnqjMiWcqkK3kugIyOHK6uj6BR5wR22DhKelT3m7
	SuB7mC6NvddmC9NOp+SVlwfC5IRsIdaz5FLLH+AF0upBeAExLGX7T+erjzwcoDy0V3xKh0W6Xoc4C
	Yuh8f7poOJlvkc9wWe5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLXa-00FVGW-MQ; Fri, 18 Jun 2021 20:56:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLWk-00FV80-By
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 20:55:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so6448161wmq.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 13:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LayfGoKGy+6qEOUXkD/+X9FAKT9xuGIfbJpjpmHqJmM=;
 b=CT61IHcpGt9JXgP3dj5MUS4zkKg5EHrLcYHWIYu9Ig0H9ATl4p4+V3oD1LuQMVaboS
 xI0yAUYQ+RGxx9uMdnfI0SYzP8LfwDi6HTM6s8tXE0gNiDEW1O03bGvOgomN4fbQ2Ws4
 8B5AtgToIWAC6MecCuUnFTbgmYlCkYe0I3F4+ToEWHeAgjGHQsPcASMI4AYEvz/lJY4I
 yQ6FQad1tSSRqOhmY71fYhZVwEJSCUts+uSOJYZvu5ksX7A5ZvtVg5Clh5c80kAJqbBM
 d13xKLSIfFHAlHUu1gXxerIdkdLT0En6llzUTl4EmkRipEklmN/or3etC1RVMCcCVF9M
 +jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LayfGoKGy+6qEOUXkD/+X9FAKT9xuGIfbJpjpmHqJmM=;
 b=VT6DfhBP/KzGXI21m9ysmr+wKsZOFO3DS7kbGaz0J36cAoynsECMsmFFC/l3kEXAk0
 qgp2OHM8cqMoKR7Ig48kZkRbd2cP/JgG+pukyky3QIamZh1Jj4zIBHNo7NjO4Q7px/Yf
 9/U+GRsFzjvt+CfW0DRVnJLgROTFhlhhme9gOSfMXFwvicDWYTwBCQj30XYlEtNNE/F2
 85UwIcnoCp1uz8kgyaWg09qR01oXIzLr+Vf0YS4TvXatywIk2KXKdHbRFJrzzeWgtnRJ
 wzh+hWX8C28BZZIgYu1GgwGZBgZvaIgFTnBjddV1Gn1dtyNWz7IEI5WLSoF9PmjIWzVz
 bDIA==
X-Gm-Message-State: AOAM5328pNY7LgqltIdFcKWzu/ghbOrxNvPF9Oo5Ss5uYI7BjbNJ9evD
 UkBS8M4eOU00ojIQMuz+NSLGTw==
X-Google-Smtp-Source: ABdhPJx8o/q4V5XXiWXS7ysEkAFpjAG9f0iPZ2oQkNZw1POTabPO6JdD67Mg6dXpiYFvpypVjFFxIQ==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr13741946wmj.134.1624049744850; 
 Fri, 18 Jun 2021 13:55:44 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:55:44 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 5/5] ARM: gemini: add device tree for ssi1328
Date: Fri, 18 Jun 2021 20:55:33 +0000
Message-ID: <20210618205533.1527384-6-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_135546_483057_7F58E39E 
X-CRM114-Status: GOOD (  16.61  )
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
Message-ID: <20210618205533.NWPuy0rGJynoDh9fet3auDOx__IsPmDlZwtBOVDxTt4@z>

The SSI 1328 is a NAS box running a SL3516 SoC.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/Makefile           |   1 +
 arch/arm/boot/dts/gemini-ssi1328.dts | 138 +++++++++++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 806715f3266d..49bf7af72111 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -221,6 +221,7 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
 	gemini-rut1xx.dtb \
 	gemini-sl93512r.dtb \
 	gemini-sq201.dtb \
+	gemini-ssi1328.dtb \
 	gemini-wbd111.dtb \
 	gemini-wbd222.dtb
 dtb-$(CONFIG_ARCH_HI3xxx) += \
diff --git a/arch/arm/boot/dts/gemini-ssi1328.dts b/arch/arm/boot/dts/gemini-ssi1328.dts
new file mode 100644
index 000000000000..2b3e7db84fed
--- /dev/null
+++ b/arch/arm/boot/dts/gemini-ssi1328.dts
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Corentin Labbe <clabbe@baylibre.com>
+ * Device Tree file for SSI 1328
+ */
+
+/dts-v1/;
+
+#include "gemini.dtsi"
+
+/ {
+	model = "SSI 1328";
+	compatible = "ssi,1328", "cortina,gemini";
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
+		bootargs = "console=ttyS0,19200n8 initrd=0x900000,9M";
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
+		/* LAN Marvell 88E1118 */
+		phy0: ethernet-phy@1 {
+			reg = <1>;
+			device_type = "ethernet-phy";
+			/* We lack the knowledge of necessary GPIO to achieve
+			 * Gigabit
+			 */
+			max-speed = <100>;
+		};
+		/* WAN ICPlus IP101A */
+		phy1: ethernet-phy@2 {
+			reg = <2>;
+			device_type = "ethernet-phy";
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
+	ethernet-port@1 {
+		phy-mode = "rgmii";
+		phy-handle = <&phy1>;
+	};
+};
+
+&flash {
+	status = "okay";
+	/* 32MB of flash */
+	reg = <0x30000000 0x03200000>;
+
+	pinctrl-names = "enabled", "disabled";
+	pinctrl-0 = <&pflash_default_pins>;
+	pinctrl-1 = <&pflash_disabled_pins>;
+
+	partitions {
+		compatible = "redboot-fis";
+		/* Eraseblock at 0xfe0000 */
+		fis-index-block = <0x7F>;
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
+	cortina,gemini-ata-muxmode = <0>;
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
+			mux {
+				function = "gpio0";
+				groups = "gpio0agrp", "gpio0bgrp";
+			};
+		};
+		pflash_disabled_pins: pinctrl-pflash-disabled {
+			mux {
+				function = "gpio0";
+				groups = "gpio0ggrp", "gpio0igrp", "gpio0jgrp",
+					 "gpio0kgrp";
+			};
+		};
+		pinctrl-gmii {
+			/* This platform use both the ethernet ports */
+			mux {
+				function = "gmii";
+				groups = "gmii_gmac0_grp", "gmii_gmac1_grp";
+			};
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
