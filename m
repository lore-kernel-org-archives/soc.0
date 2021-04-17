Return-Path: <SRS0=5mch=JO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB12C433ED
	for <soc@archiver.kernel.org>; Sat, 17 Apr 2021 01:11:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F405B613B0; Sat, 17 Apr 2021 01:11:37 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B615460233
	for <soc@kernel.org>; Sat, 17 Apr 2021 01:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B615460233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pf1-f169.google.com with SMTP id h15so1747035pfv.2
        for <soc@kernel.org>; Fri, 16 Apr 2021 18:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DjE5M9M5jRthI7V37X8gqi/YzZYKLarjADVCR4EpqlU=;
        b=rIkha+FoUYvB7CL0e1okwuoTh16BMF5NzOjcugAU5HxEkojxwQX0EYuq+NnFI9uSD5
         Fk2ta2jZp/LDO1mbohtJ6mKrSBb+P8cTDHXl5Nht2hEvgRR7/dHzZXJkVb23lpJC9ww+
         TLGMUPy1+ngmU+rJdKkX5SeP6E/7PNSHPdAeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DjE5M9M5jRthI7V37X8gqi/YzZYKLarjADVCR4EpqlU=;
        b=A5kVHF4Zeg1OeQB86TD5H5iCMB6xTTV9kONfDjjgcJJaqZLlV0uRz7W/stYwQqT5h1
         mr0eHU2IYGeeIIDM1yKyasl8/j1NxITn1LYEJ5EQg7mPltjOFSrcFfe2V0ZrTcksGRNU
         pDMEIjn2NpxNse/mq0rCLCmfwlrG08DoaSBujGWwnx+fBnmhjfdQOlJqtv9nV1xX+Wtc
         kaWQyB5nJrY90zp08H2SAdjTSc4Gzw1/zbcJ73jD53JyeS3yWqDQvaN6vBZQy64xNxmq
         fLY2U8EOVqhRjzy2NyMR7sTt3CILIfEr4Jo0ZWmsBEpJd0Ceq09ta7TBK40ol5CSFGgX
         qoXw==
X-Gm-Message-State: AOAM533ntNapaDcNQt/Z9HnhsTzCSL2nZejzjSz3rEyhg2DU81Oq+QMC
	JQgxVc/V64d2NwNZEYJqg4sAWQ==
X-Google-Smtp-Source: ABdhPJxYL4jwj2wr5/CUQx0LynwDfVQMtuuKB+roDjT7Tn79/nRKrbabWXhRKM4RNtQReyLD/qFe3A==
X-Received: by 2002:a62:cf83:0:b029:24a:935:e2f1 with SMTP id b125-20020a62cf830000b029024a0935e2f1mr10149297pfg.8.1618621897269;
        Fri, 16 Apr 2021 18:11:37 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id x17sm2181515pjr.0.2021.04.16.18.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 18:11:37 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	olof@lixom.net,
	arnd@kernel.org
Cc: w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/3] ARM: dts: mstar: Add a dts for M5Stack UnitV2
Date: Sat, 17 Apr 2021 10:10:15 +0900
Message-Id: <20210417011015.2105280-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210417011015.2105280-1-daniel@0x0f.com>
References: <20210417011015.2105280-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M5Stack are releasing a new widget based on the
SigmaStar SSD202D. We have some support for the
SSD202D so lets add a dts for it.

Link: https://m5stack-store.myshopify.com/products/unitv2-ai-camera-gc2145
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/mstar-infinity2m-ssd202d-unitv2.dts   | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e75e..66ddc7d0bd03 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1397,6 +1397,7 @@ dtb-$(CONFIG_ARCH_MILBEAUT) += milbeaut-m10v-evb.dtb
 dtb-$(CONFIG_ARCH_MSTARV7) += \
 	mstar-infinity-msc313-breadbee_crust.dtb \
 	mstar-infinity2m-ssd202d-ssd201htv2.dtb \
+	mstar-infinity2m-ssd202d-unitv2.dtb \
 	mstar-infinity3-msc313e-breadbee.dtb \
 	mstar-mercury5-ssc8336n-midrived08.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
new file mode 100644
index 000000000000..a81684002e45
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+/dts-v1/;
+#include "mstar-infinity2m-ssd202d.dtsi"
+
+/ {
+	model = "UnitV2";
+	compatible = "m5stack,unitv2", "mstar,infinity2m";
+
+	aliases {
+		serial0 = &pm_uart;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&pm_uart {
+	status = "okay";
+};
-- 
2.31.0

