Return-Path: <SRS0=DTuh=WI=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D71CCA47A
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 15:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 187FEC3411A; Wed,  1 Jun 2022 15:47:47 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99013C385A5
	for <soc@kernel.org>; Wed,  1 Jun 2022 15:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99013C385A5
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f47.google.com with SMTP id l13so3407615lfp.11
        for <soc@kernel.org>; Wed, 01 Jun 2022 08:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y3JvSDWyNzZ3ubMu+5VkO/66cKXhEY5f22UYF/SL+Mg=;
        b=Vhh2E7NNBEcv7+QVjiVBJmG8TCrBPdxgdnYQJ3YWT/7igbMMDlzAqIUzfy3Vrv8aN2
         KoVnWp3dlV7NAsUrzB5c+hPHcxZM+zfUZKDBllQG7CVwWTEh0sScluIjVIGqyvWBrtcN
         aoUEifsKbNzpETq8OkaFf6unIfaAkau07wNjJAhTfMJFNLRW4l6Vu4AyhVoXhnrfjJ+F
         MyfqIzSUP659htUlP7mBvN2Lq25A0ZU/K5ZdZOaht8BIPUl+LWY1tUcSrSxsw1ahTDgN
         NTILbXSzjLkl62pmtrUk2QhnB4G05WAq/VJjQnIo6+qgQ8OSOx0NECnHB22lBtQvUBe9
         XpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y3JvSDWyNzZ3ubMu+5VkO/66cKXhEY5f22UYF/SL+Mg=;
        b=2W9ZVf/3XqH0CSCbwxC7RoL2PadnL13bGgVU2eyXVyLJvwKuCjAnhiuplFISpQ6GSV
         81JHPAeXWS1C/+oX+V+gcxDAOyH11aRTte5Qa00vm78QL+ihrZggOkdpazOxcVY7RNQR
         AhVRlew0qF7BY2d3AfET8CuujgV86AYnGnzznlaIaVBDC7tNJe8nlwRyH1Tr+z0pXUkR
         z0VAtRb8lw0xZtO0PSc8n9J+tFIQaFMkOAD1PuEaXA+uR670YSnnoIj6j5/uJGMo90CT
         RTadLFfXamjsn8zJhkhhUA5GWdaFXua9sxpXW2lDVu8GWblIjedWQDx6cji70AzvBLG/
         /8ew==
X-Gm-Message-State: AOAM533vzk3tU4jVONSEpyu8z5AsLrtmA7yBMNWkO/vFJL+npc6u/r/z
	vjj2v0sEQzevhuUtzFSbnz20JYMdBWpGOQ==
X-Google-Smtp-Source: ABdhPJyz31uUXCHhwnTbXJyTM8r9rEhWOAlYmT/8lkQ3scCemE7RzYx9SUMpUL5FgRRdnLPpnVMKfg==
X-Received: by 2002:a05:6512:3130:b0:479:2e0:631b with SMTP id p16-20020a056512313000b0047902e0631bmr2903593lfd.561.1654098464757;
        Wed, 01 Jun 2022 08:47:44 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id f10-20020a19380a000000b00478ad871b25sm431219lfa.145.2022.06.01.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:47:44 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dinguyen@kernel.org,
	amstan@chromium.org,
	upstream@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 4/5] ARM: dts: socfpga: Add Google Chameleon v3 devicetree
Date: Wed,  1 Jun 2022 17:46:46 +0200
Message-Id: <20220601154647.80071-5-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601154647.80071-1-pan@semihalf.com>
References: <20220601154647.80071-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add devicetree for the Google Chameleon v3 board.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../boot/dts/socfpga_arria10_chameleonv3.dts  | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 023c8b4ba45c..9417106d3289 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1146,6 +1146,7 @@ dtb-$(CONFIG_ARCH_S5PV210) += \
 	s5pv210-torbreck.dtb
 dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += \
 	socfpga_arria5_socdk.dtb \
+	socfpga_arria10_chameleonv3.dtb \
 	socfpga_arria10_socdk_nand.dtb \
 	socfpga_arria10_socdk_qspi.dtb \
 	socfpga_arria10_socdk_sdmmc.dtb \
diff --git a/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
new file mode 100644
index 000000000000..422d00cd4c74
--- /dev/null
+++ b/arch/arm/boot/dts/socfpga_arria10_chameleonv3.dts
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2022 Google LLC
+ */
+/dts-v1/;
+#include "socfpga_arria10_mercury_aa1.dtsi"
+
+/ {
+	model = "Google Chameleon V3";
+	compatible = "google,chameleon-v3", "enclustra,mercury-aa1",
+		     "altr,socfpga-arria10", "altr,socfpga";
+
+	aliases {
+		serial0 = &uart0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+	};
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&gpio0 {
+	status = "okay";
+};
+
+&gpio1 {
+	status = "okay";
+};
+
+&gpio2 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	ssm2603: audio-codec@1a {
+		compatible = "adi,ssm2603";
+		reg = <0x1a>;
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	u80: gpio@21 {
+		compatible = "nxp,pca9535";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"SOM_AUD_MUTE",
+			"DP1_OUT_CEC_EN",
+			"DP2_OUT_CEC_EN",
+			"DP1_SOM_PS8469_CAD",
+			"DPD_SOM_PS8469_CAD",
+			"DP_OUT_PWR_EN",
+			"STM32_RST_L",
+			"STM32_BOOT0",
+
+			"FPGA_PROT",
+			"STM32_FPGA_COMM0",
+			"TP119",
+			"TP120",
+			"TP121",
+			"TP122",
+			"TP123",
+			"TP124";
+	};
+};
+
+&mmc {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.36.1.255.ge46751e96f-goog

