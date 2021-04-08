Return-Path: <SRS0=QRcX=JF=linaro.org=manivannan.sadhasivam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5E3C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 06:22:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ED67961181; Thu,  8 Apr 2021 06:22:49 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7CC961178
	for <soc@kernel.org>; Thu,  8 Apr 2021 06:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7CC961178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=manivannan.sadhasivam@linaro.org
Received: by mail-pg1-f172.google.com with SMTP id b17so664182pgh.7
        for <soc@kernel.org>; Wed, 07 Apr 2021 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5j55AIKXs4c80ut0LuiEEzUyH///apdN9jqfe/vdEMU=;
        b=rm3KWCO7ayjSg0Stq9ui8jiHZsvG/6gludBzsSl+xQm5x01LlTXmBEhT2QTzKMOIfW
         ZUIzfdPQGWB8wx+63kWa5rfA1QOfQDlgP1Zmd3UIqZrZozvaS7ufe6Wa4IpcMFAgM2ft
         FyRBcoNy/5b6R4PszNNzNVoE+18QVDnrhyElOAdd6SR1JWB6wXfYXcuQl/XwUCQmB4mV
         B8FZX6y05nJkPgDgMs+jYN9u+MtRhMorbkwVeLSS0lOto+IlAKi0TKAMpynf549TABXl
         9dBYD7zwgUs74+Pwrn4ZpuuXf478himLPgdTRfPO1s0dNM55gXoF4/l38rQbz6t53vNm
         nj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5j55AIKXs4c80ut0LuiEEzUyH///apdN9jqfe/vdEMU=;
        b=I/mGSx5Iz8sxw/syLWJFYJkI1zhIUzXKHe5586yv4O2fNrvKTHgs2Yid9oxAOW0I14
         aYiPwMbt0Cdo9n/P2CsEZqcFcj/RLunDblImwFOUfUPethqnUqJ0sBnM8u1/RbB9kfp+
         VhnehBceux8cWCk0ct17126MuCegGFi035vPSI37LS1JP7CX/tekfW66p+hkeWMjChip
         2aDbYJn+ipEZSyboqvpG45dabSlg7xulU83iNWiFM0miPHevNQui32FXlwmHUlg+0EdE
         55eUIr0fKe4+hBvvn6sS5A41UuY/+hqY6EzfvwVpnwVekwzwrQ07bcMdke2+Cb37PClb
         CxqA==
X-Gm-Message-State: AOAM533IUm2qb8II3B8eZHihn3OR3O4CFUa67YtuP5O2rQDlTL5uFwv1
	xoz5tvLh/tSCNWyOBqp91PyBLq47BZHjA2E=
X-Google-Smtp-Source: ABdhPJxq0w9c5T2eoHxeJMVactroxGubXVkTvDu49v8pIsYtueP8TINDvvZ5JmegD5U0RTN6oE2fVA==
X-Received: by 2002:a63:dc49:: with SMTP id f9mr6595263pgj.361.1617862969101;
        Wed, 07 Apr 2021 23:22:49 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e85:565f:2e19:9e93:4526:a814])
        by smtp.gmail.com with ESMTPSA id w7sm18926652pff.208.2021.04.07.23.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 23:22:48 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: olof@lixom.net,
	arnd@arndb.de,
	afaerber@suse.de,
	linux-actions@lists.infradead.org,
	thomas.liau@actions-semi.com,
	cristian.ciocaltea@gmail.com,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH] ARM: dts: owl-s500-roseapplepi: Add ATC2603C PMIC
Date: Thu,  8 Apr 2021 11:52:32 +0530
Message-Id: <20210408062232.3575-1-mani@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Add device tree node for ATC2603C PMIC and remove the 'fixed-3.1V'
dummy regulator used for the uSD supply.

Additionally, add 'SYSPWR' fixed regulator and provide cpu0 supply.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Link: https://lore.kernel.org/r/2e0a2931ae3757f016948e7c78e8e54afa325ae0.1615538629.git.cristian.ciocaltea@gmail.com
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---

Just a single patch for v5.13, so sending it directly. The corresponding
driver and binding patches are merged into mfd tree.

 arch/arm/boot/dts/owl-s500-roseapplepi.dts | 132 ++++++++++++++++++++-
 1 file changed, 126 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/owl-s500-roseapplepi.dts b/arch/arm/boot/dts/owl-s500-roseapplepi.dts
index ff91561ca99c..b8c5db2344aa 100644
--- a/arch/arm/boot/dts/owl-s500-roseapplepi.dts
+++ b/arch/arm/boot/dts/owl-s500-roseapplepi.dts
@@ -2,7 +2,7 @@
 /*
  * Roseapple Pi
  *
- * Copyright (C) 2020 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
+ * Copyright (C) 2020-2021 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
  */
 
 /dts-v1/;
@@ -27,20 +27,140 @@ memory@0 {
 		reg = <0x0 0x80000000>; /* 2GB */
 	};
 
-	/* Fixed regulator used in the absence of PMIC */
-	sd_vcc: sd-vcc {
+	syspwr: regulator-5v0 {
 		compatible = "regulator-fixed";
-		regulator-name = "fixed-3.1V";
-		regulator-min-microvolt = <3100000>;
-		regulator-max-microvolt = <3100000>;
+		regulator-name = "SYSPWR";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
 };
 
+&cpu0 {
+	cpu0-supply = <&vdd_cpu>;
+};
+
 &i2c0 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
+
+	atc260x: pmic@65 {
+		compatible = "actions,atc2603c";
+		reg = <0x65>;
+		interrupt-parent = <&sirq>;
+		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+
+		reset-time-sec = <6>;
+
+		regulators {
+			compatible = "actions,atc2603c-regulator";
+
+			dcdc1-supply = <&syspwr>;
+			dcdc2-supply = <&syspwr>;
+			dcdc3-supply = <&syspwr>;
+			ldo1-supply = <&syspwr>;
+			ldo2-supply = <&syspwr>;
+			ldo3-supply = <&syspwr>;
+			ldo5-supply = <&syspwr>;
+			ldo6-supply = <&syspwr>;
+			ldo7-supply = <&syspwr>;
+			ldo8-supply = <&syspwr>;
+			ldo11-supply = <&syspwr>;
+			ldo12-supply = <&syspwr>;
+			switchldo1-supply = <&vcc>;
+
+			vdd_cpu: dcdc1 {
+				regulator-name = "VDD_CPU";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-always-on;
+			};
+
+			vddq: dcdc2 {
+				regulator-name = "VDDQ";
+				regulator-min-microvolt = <1300000>;
+				regulator-max-microvolt = <2150000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			vcc: dcdc3 {
+				regulator-name = "VCC";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vcc_3v3: ldo1 {
+				regulator-name = "VCC_3V3";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			avcc: ldo2 {
+				regulator-name = "AVCC";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			vdd_1v8: ldo3 {
+				regulator-name = "VDD_1V8";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-always-on;
+			};
+
+			vcc_3v1: ldo5 {
+				regulator-name = "VCC_3V1";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			avdd: ldo6 {
+				regulator-name = "AVDD";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-always-on;
+			};
+
+			sens_1v8: ldo7 {
+				regulator-name = "SENS_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			ldo8: ldo8 {
+				regulator-name = "LDO8";
+				regulator-min-microvolt = <2300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			svcc: ldo11 {
+				regulator-name = "SVCC";
+				regulator-min-microvolt = <2600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			rtc_vdd: ldo12 {
+				regulator-name = "RTC_VDD";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			sd_vcc: switchldo1 {
+				regulator-name = "SD_VCC";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+		};
+	};
 };
 
 &i2c1 {
-- 
2.25.1

