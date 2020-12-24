Return-Path: <SRS0=SIYQ=F4=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558D6C433DB
	for <soc@archiver.kernel.org>; Thu, 24 Dec 2020 02:04:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1569822571; Thu, 24 Dec 2020 02:04:10 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A63A2256F
	for <soc@kernel.org>; Thu, 24 Dec 2020 02:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A63A2256F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f173.google.com with SMTP id n10so685625pgl.10
        for <soc@kernel.org>; Wed, 23 Dec 2020 18:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6GGRKwj/V72sgXB5x/GYoZyHZnvC0fUrPze665l1A3Y=;
        b=n0hC6LYXnsWzYbKJUxRHnkLmYFDvKRNXxUglzhk/S0PU1HnlsbU0Tj1R6EYspQLtvj
         fkHGIfnqJfjes5EVeGqBQv6JLaYOBrZP8kpzjviWVmRXLF8qTY8n/EzqhzVyninoIUZ/
         mEvo3x9HtvCN3mWolnSigCoSADbbJmm9KXhdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6GGRKwj/V72sgXB5x/GYoZyHZnvC0fUrPze665l1A3Y=;
        b=Uco5ib15ULHiZwJWChUgx0XZOQvcyhOluVgL9qgH7SUpNGYdtGVdxSWmlmthnMa0MB
         g0BBUUFbePrnpFC6dLpkDKREORBLX5oPMUuuvjb8j9CYYgxAOL2vyTTaZkQX5qflG+5u
         iKAdAq8CdHcloV+47HmYxBPg13sQpUu6DgdhZriQwwJY8+5BIwPhPgTHR8OxL7gEu3PH
         23QwpC/Cl2BF2Pr42W+8OfZb6pPKQnQ5P2JrCk/MTL68ACcbT75SQKx8rtsk050b2S/r
         Re6l4M83nbDtJO760h8hqPHbq05wRQnJA3gpLGNI1qQKen9nRHhJUtu7kldDiV8GTcbf
         M1gQ==
X-Gm-Message-State: AOAM530hpJQOHITncz4hp5o1paJqRfcaIod52Z4hkDcBDDjiQeJdnif5
	NyPYxbOGIGoiw5krHg9xGPpN94iZM7qObg==
X-Google-Smtp-Source: ABdhPJyyxa/q5anc6DBZR2srp741iNm0H7XIBW2Sow3jBUv/Z4CCvkhSAXcwsgVWWhSPbdU3XSb8tg==
X-Received: by 2002:a63:8c15:: with SMTP id m21mr11410215pgd.396.1608775448301;
        Wed, 23 Dec 2020 18:04:08 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id t1sm745564pju.43.2020.12.23.18.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 18:04:07 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2] ARM: mstar: Unify common parts of BreadBee boards into a dtsi
Date: Thu, 24 Dec 2020 11:03:54 +0900
Message-Id: <20201224020354.2212037-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BreadBee and the BreadBee Crust are the same PCB with a different
SoC mounted. There are two top level dts to handle this.

To avoid deduplicating the parts that are more related to the PCB than
the SoC (i.e. the voltage regs and LEDs) add a common dtsi that can
be included in both top level dts.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../dts/mstar-infinity-breadbee-common.dtsi   | 49 +++++++++++++++++++
 .../mstar-infinity-msc313-breadbee_crust.dts  |  1 +
 .../dts/mstar-infinity3-msc313e-breadbee.dts  |  1 +
 3 files changed, 51 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi

diff --git a/arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi b/arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi
new file mode 100644
index 000000000000..507ff2fba837
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	vcc_core: fixedregulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_core";
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+		regulator-boot-on;
+	};
+
+	vcc_dram: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_dram";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+	};
+
+	vcc_io: fixedregulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_io";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		red {
+			gpios = <&gpio MSC313_GPIO_SR_IO16 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "activity";
+		};
+		yellow {
+			gpios = <&gpio MSC313_GPIO_SR_IO17 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vcc_core>;
+};
diff --git a/arch/arm/boot/dts/mstar-infinity-msc313-breadbee_crust.dts b/arch/arm/boot/dts/mstar-infinity-msc313-breadbee_crust.dts
index f9db2ff86f2d..db4910dcb8a7 100644
--- a/arch/arm/boot/dts/mstar-infinity-msc313-breadbee_crust.dts
+++ b/arch/arm/boot/dts/mstar-infinity-msc313-breadbee_crust.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 #include "mstar-infinity-msc313.dtsi"
+#include "mstar-infinity-breadbee-common.dtsi"
 
 / {
 	model = "BreadBee Crust";
diff --git a/arch/arm/boot/dts/mstar-infinity3-msc313e-breadbee.dts b/arch/arm/boot/dts/mstar-infinity3-msc313e-breadbee.dts
index f0eda80a95cc..e64ca4ce1830 100644
--- a/arch/arm/boot/dts/mstar-infinity3-msc313e-breadbee.dts
+++ b/arch/arm/boot/dts/mstar-infinity3-msc313e-breadbee.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 #include "mstar-infinity3-msc313e.dtsi"
+#include "mstar-infinity-breadbee-common.dtsi"
 
 / {
 	model = "BreadBee";
-- 
2.29.2

