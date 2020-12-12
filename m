Return-Path: <SRS0=KgY5=FQ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70269C4361B
	for <soc@archiver.kernel.org>; Sat, 12 Dec 2020 02:47:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1CE102343E; Sat, 12 Dec 2020 02:47:03 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9B122D06
	for <soc@kernel.org>; Sat, 12 Dec 2020 02:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9B122D06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f65.google.com with SMTP id v1so3160533pjr.2
        for <soc@kernel.org>; Fri, 11 Dec 2020 18:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KR85+Gtdem0Gv7clmGZtNq8Ahg6SgE54nF/g8Upvyss=;
        b=mTEvr0VibOqLvEug3aL4pUxFPYKXn81LJv+anjADWxWMeadNR+t4ymtJcICySr0CAS
         t8GW7rzl5l5Vv3KThySNl54AU+15VaBRpQCHjX/9csYX46yl0KWQOLVbZbEOezA15Bvf
         ayWh1/T9c4EjSIyQ1b38MZXG9yrBhTKLlV8T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KR85+Gtdem0Gv7clmGZtNq8Ahg6SgE54nF/g8Upvyss=;
        b=VdwjEciTkEmQ9/1YAR75CpNVgpn5CmGHHcvVxibOgo2LinJlGZOZRyijoZBZKobEKD
         guUl9xgrR7CwC2EKxo1asBztRJ61B42i2k9TVnVJHbtXvtijSCH3sxEiYKfQxKEW1kqS
         dlB3OrL1Uldwq7Udrz3D8wr5U4/F4mSq1SU53lmRCa+YfyOLlulI2dWGqO3SzzQ7ayTh
         cKzM3XoL5HPEG1LBICOqNXWRtrmaL7t7V0ZDhLTi8WokcQePLNtAEmhJ8vaakQFNE8Ss
         TndLLDCpPO6YTPKLayFCM7ePDPYUFXQWEFkvOo/+Ir7uXPKpyXzP0/CjCmqtMzO1C54Z
         T1ZA==
X-Gm-Message-State: AOAM533wljCc1cL2fGivsxA9m6uZl193YIlf3C8e1bAWzJTNsd3BdGgy
	e2L7eLlBuS8Brdao/O0nJBx/ULlvdBHdXA==
X-Google-Smtp-Source: ABdhPJyjojuUBUF+16+qT8N4gkR7nSxLeaPZz06+71H6fSnt3My242D0AUcUZ/bKNOvhtp0B5MAePA==
X-Received: by 2002:a17:902:8b89:b029:d6:df6e:54df with SMTP id ay9-20020a1709028b89b02900d6df6e54dfmr13759213plb.0.1607741221516;
        Fri, 11 Dec 2020 18:47:01 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id q12sm12020086pgv.91.2020.12.11.18.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 18:47:00 -0800 (PST)
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
Subject: [PATCH 1/7] ARM: mstar: Unify common parts of BreadBee boards into a dtsi
Date: Sat, 12 Dec 2020 11:46:43 +0900
Message-Id: <20201212024643.388335-1-daniel@0x0f.com>
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
 .../dts/mstar-infinity-breadbee-common.dtsi   | 47 +++++++++++++++++++
 .../mstar-infinity-msc313-breadbee_crust.dts  |  1 +
 .../dts/mstar-infinity3-msc313e-breadbee.dts  |  1 +
 3 files changed, 49 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi

diff --git a/arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi b/arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi
new file mode 100644
index 000000000000..53244b399126
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-infinity-breadbee-common.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
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

