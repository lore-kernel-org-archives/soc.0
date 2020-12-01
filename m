Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC28C64E7B
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:43:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 850442084C; Tue,  1 Dec 2020 13:43:58 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F813207FF
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="f/2IpXak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F813207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pl1-f196.google.com with SMTP id 4so1155975plk.5
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nZs3cd4haoA+TDqA6POpYN8YC7m6XfHT6GH0HjPmBjM=;
        b=f/2IpXakdLzHmPBxF37xXRsHxu3TP7ceBiybQPbSxCHdq/+YZHfI4Pf00ORWxGOiqp
         Is9Kyvb3TV2BBX7H43WL0S+TeanOTIv6tlKJtOR5EwwfO50rjF5lUlwYAhLknKSxgH4s
         4GQSPSEFK6eYi+B9KWj3sJm3GwqQA7eMt3/5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nZs3cd4haoA+TDqA6POpYN8YC7m6XfHT6GH0HjPmBjM=;
        b=GMhIQ5H+Y3Hqhn7T4EIgf2kGsVKGbjBN4PMII1N9JbGmJ1f5vwNEfB9Pjb9awnA0og
         Cd2aaT9/K/UoeqtsTjzIdn/Kl8Pgj2dt5VvvEj3WVGX9BFMIgE787aD77s4cea4aHYd6
         u10ObLXXafz4tgZla5RsA/9mwxu694uTBOQ/EbE1ab+RBRHHikmsjNVN17k5iOevj4KK
         uR9Ho3xIGZ4nXs6ySjSUvfbDzPkNAt9wIEC+Ndd0f795346PKRCyd0yNYZGqXffzAHwV
         pcFuqmAeOV3bARrCp2AdT+Lp1Jvr4VKK8PSyjt6riCg1YFNNh9vHIaIh9Sf2cR3wkrtP
         B5XQ==
X-Gm-Message-State: AOAM5325PWmtlnsG5Qpt3QX+6t1ZHxRDPIyzhPZpXDgLlah4/jmp5gfQ
	ZjDkcVuj2Jb+rN+JKoh7M/jbSe7XZMPFeA==
X-Google-Smtp-Source: ABdhPJzlpZrs7tYCs+bVPPekgHDRENk2SgSkvvOa2zESTJWo07869xM/hna2VCsk8cT9VcgBPLJ3cw==
X-Received: by 2002:a17:90a:a487:: with SMTP id z7mr2838802pjp.102.1606830237578;
        Tue, 01 Dec 2020 05:43:57 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:56 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	olof@lixom.net,
	arnd@arndb.de,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v2 07/10] ARM: mstar: Add dts for Honestar ssd201htv2
Date: Tue,  1 Dec 2020 22:43:27 +0900
Message-Id: <20201201134330.3037007-8-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dts for the Honestar ssd201htv2 devkit.
This is for the board populated with a SSD202D.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 .../mstar-infinity2m-ssd202d-ssd201htv2.dts   | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ce66ffd5a1bb..ccbf44b6f32a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1372,6 +1372,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 dtb-$(CONFIG_ARCH_MILBEAUT) += milbeaut-m10v-evb.dtb
 dtb-$(CONFIG_ARCH_MSTARV7) += \
 	mstar-infinity-msc313-breadbee_crust.dtb \
+	mstar-infinity2m-ssd202d-ssd201htv2.dtb \
 	mstar-infinity3-msc313e-breadbee.dtb \
 	mstar-mercury5-ssc8336n-midrived08.dtb
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
diff --git a/arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts
new file mode 100644
index 000000000000..5d81641414a2
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+/dts-v1/;
+#include "mstar-infinity2m-ssd202d.dtsi"
+
+/ {
+	model = "SSD201_HT_V2";
+	compatible = "honestar,ssd201htv2", "mstar,infinity2m";
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
2.29.2

