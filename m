Return-Path: <SRS0=pZgq=FQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2B0C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Dec 2020 02:48:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC72922DFB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Dec 2020 02:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC72922DFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9UceKFmO0PKf1mMwkl9SUdQWE2TUGuO58D1Tr07HgTU=; b=VHZmvFmAQ3MLYxqYW+Q6DR7hgK
	OEUtL1kwhb4UPG2nkyDpA+aTMRUnQlNJNLi9JIT/3M70Gihb4/uAc80ndYuc6LvoKagBkekH7+VYh
	2Se4X394NJBe1hoPb/JjDQhryqmtZcueXPruL2qsXD6kVO2PEjxx5C6dbFsHw7UVLb9kxM4WEkPQ9
	HME3sRCF4rHZv0u1FFGVlP/OJei560/AHK3+MDXVyDkLsIjw7VGEL0z5zbIXRtsd31HcBHjiP0lZ3
	LwxrWe75aAGRHTkBjB6s2p0WBGzYCMc/uiojXUDclVhVXzNZl0ofRuIgH9scO7ibgNgpsPAJw99s8
	JEYH78Aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knuwB-0006XJ-Ep; Sat, 12 Dec 2020 02:47:11 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knuw7-0006Wq-IF
 for linux-arm-kernel@lists.infradead.org; Sat, 12 Dec 2020 02:47:09 +0000
Received: by mail-pl1-x642.google.com with SMTP id r4so5579216pls.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Dec 2020 18:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
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
 b=oMFhfzQfj3CruqxijPrXPBMsSk6pt8bhGOhX2c/BgaEet/zupCgMuHySKpl9RJVZYA
 6WTm2vjncohhXLN77fPpCIYaLiDlCA2Wet4xEQLHF2GNvaka17Vhs5e31HIDTFq1lFO1
 wE0OcM30MGtxvM2Ksz/0cr/THau1GcDgwKIXOTY2rGIJMWNTQIHyyvxDVOSDCMw913mN
 jEnucnwAsniE2neHoduz4FvePs/6r7FhwsOpWMd+ezvnsx43qW7umldRT7Yj4Z6T8Y5o
 EBn/CUWnsTjk+zi7htUeJqybZ3F299/zOssF7AWaZwzQnSh0Bl5qE27+XY1Y5Yidvl2N
 +LLg==
X-Gm-Message-State: AOAM530kc8TWXT4VxZhM4vnw0TaiW5FLfhP0/qaBm75OJYuPU3Q4ngeD
 qG3MQvwni4VHZRQaACSXw4xSDA==
X-Google-Smtp-Source: ABdhPJyjojuUBUF+16+qT8N4gkR7nSxLeaPZz06+71H6fSnt3My242D0AUcUZ/bKNOvhtp0B5MAePA==
X-Received: by 2002:a17:902:8b89:b029:d6:df6e:54df with SMTP id
 ay9-20020a1709028b89b02900d6df6e54dfmr13759213plb.0.1607741221516; 
 Fri, 11 Dec 2020 18:47:01 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id q12sm12020086pgv.91.2020.12.11.18.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 18:47:00 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/7] ARM: mstar: Unify common parts of BreadBee boards into a
 dtsi
Date: Sat, 12 Dec 2020 11:46:43 +0900
Message-ID: <20201212024643.388335-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_214707_996308_9F2D1E91 
X-CRM114-Status: GOOD (  15.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: arnd@arndb.de, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201212024643.ObTXIEXyz9Cq8OPsevXkZHcelXs4Q2lqIlTDMUAmrbA@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
