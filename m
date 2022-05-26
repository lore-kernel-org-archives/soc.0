Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A98C433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2F69C34116; Thu, 26 May 2022 20:42:29 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44FA9C34113
	for <soc@kernel.org>; Thu, 26 May 2022 20:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44FA9C34113
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id o28so3172040edi.1
        for <soc@kernel.org>; Thu, 26 May 2022 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADqKJdbqKJgJ+Kg0DAm3wQJ6kaap7SQu0KoHV5lMi6o=;
        b=UW/PIlwYn0ZoAUDaWjJIFIjFaJDJDpE22GNHHXfyeFrpw8sAg9hGAqJUuXHhlcOI0S
         Uuk1MqkSrW2j/eY1+x65UOWevsmO1H24hHTlmrLIzAaBy8fWfIHuESxie3PDbhitU4XI
         UuiZwqwRGIa6jap7jzXiEx8bskStr/mKiHi0Qf1BDp7P8sWEWT6P/x/7aVbaY/A0PXFF
         Q3/h3CdAONbLeV2+sinmhsRtSab2nY8417dlg1stPZtYAp6u1/ymJ/0nCgSeAUkAawHB
         k/ZlXCMweXeHyK3Ym0mGTg8kauAy0Lb4/btc23UYeB4F7ae+HVKBmETprFUIljfL5hM6
         JZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADqKJdbqKJgJ+Kg0DAm3wQJ6kaap7SQu0KoHV5lMi6o=;
        b=l0wxh499kIBwJF2t2t5tsk0fIqAXwog4SG9swi0v1Ss1R98rtmaCBAUl/ot/LA0Uod
         GhjaG51heYPWIPArkcPuXOFkeboCBY1U/bgOLq/11hrbV+85AJUpaLU50gcb9IJbjT4E
         pF5UpSgQ7KFdfbsDJHvPbEEMK8K3BCVmC37zR8gnImHJwku+pQm6pc3UUNMO1VCy1VgX
         X1rsRPdUtUqVhw/28VuqCJYp8cg1sz8n9OkmW8yi/9uNecqWB/RDKcHU7dg6k60IQ84D
         aV9aayZo5GlKJjkej8MnSkFZqfAUdW157m4lRUCEQZWlyTuy1pQBmcOjMguaW7wvoo6X
         +Mbw==
X-Gm-Message-State: AOAM530um8CuinQKFsA2odp46J+H3Z21BjDGfBaptaCCbgFTspwvdv+z
	z6sWGWPtkcz0v0OvmPNfu3kqXQ==
X-Google-Smtp-Source: ABdhPJy3RfkUoqMH5w0G5VrkKRX7O3+5DdIFoLZRfjDU7Ds5U1HKL4bPRFugK9rvtFvsNaJPlNg6zw==
X-Received: by 2002:a05:6402:1113:b0:428:679e:f73f with SMTP id u19-20020a056402111300b00428679ef73fmr42108111edv.378.1653597746602;
        Thu, 26 May 2022 13:42:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r17-20020a50d691000000b0042617ba6389sm1239732edi.19.2022.05.26.13.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:42:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ARM: dts: rv1108: adjust whitespace around '='
Date: Thu, 26 May 2022 22:42:18 +0200
Message-Id: <20220526204218.832029-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204218.832029-1-krzysztof.kozlowski@linaro.org>
References: <20220526204218.832029-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/rv1108-elgin-r1.dts | 14 +++++++-------
 arch/arm/boot/dts/rv1108-evb.dts      | 14 +++++++-------
 arch/arm/boot/dts/rv1108.dtsi         |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/rv1108-elgin-r1.dts b/arch/arm/boot/dts/rv1108-elgin-r1.dts
index 0c99a5934ebf..2d9994379eb2 100644
--- a/arch/arm/boot/dts/rv1108-elgin-r1.dts
+++ b/arch/arm/boot/dts/rv1108-elgin-r1.dts
@@ -83,7 +83,7 @@ rk805: pmic@18 {
 
 		regulators {
 			vdd_core: DCDC_REG1 {
-				regulator-name= "vdd_core";
+				regulator-name = "vdd_core";
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
@@ -95,7 +95,7 @@ regulator-state-mem {
 			};
 
 			vdd_buck2: DCDC_REG2 {
-				regulator-name= "vdd_buck2";
+				regulator-name = "vdd_buck2";
 				regulator-min-microvolt = <2200000>;
 				regulator-max-microvolt = <2200000>;
 				regulator-always-on;
@@ -106,7 +106,7 @@ regulator-state-mem {
 			};
 
 			vcc_ddr: DCDC_REG3 {
-				regulator-name= "vcc_ddr";
+				regulator-name = "vcc_ddr";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-state-mem {
@@ -115,7 +115,7 @@ regulator-state-mem {
 			};
 
 			vcc_io: DCDC_REG4 {
-				regulator-name= "vcc_io";
+				regulator-name = "vcc_io";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
@@ -127,7 +127,7 @@ regulator-state-mem {
 			};
 
 			vdd_10: LDO_REG1 {
-				regulator-name= "vdd_10";
+				regulator-name = "vdd_10";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
@@ -138,7 +138,7 @@ regulator-state-mem {
 			};
 
 			vcc_18: LDO_REG2 {
-				regulator-name= "vcc_18";
+				regulator-name = "vcc_18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
@@ -149,7 +149,7 @@ regulator-state-mem {
 			};
 
 			vdd10_pmu: LDO_REG3 {
-				regulator-name= "vdd10_pmu";
+				regulator-name = "vdd10_pmu";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
diff --git a/arch/arm/boot/dts/rv1108-evb.dts b/arch/arm/boot/dts/rv1108-evb.dts
index 46cad7cb94bf..ef150f4ee99d 100644
--- a/arch/arm/boot/dts/rv1108-evb.dts
+++ b/arch/arm/boot/dts/rv1108-evb.dts
@@ -96,7 +96,7 @@ rk805: pmic@18 {
 
 		regulators {
 			vdd_core: DCDC_REG1 {
-				regulator-name= "vdd_core";
+				regulator-name = "vdd_core";
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
@@ -108,7 +108,7 @@ regulator-state-mem {
 			};
 
 			vdd_cam: DCDC_REG2 {
-				regulator-name= "vdd_cam";
+				regulator-name = "vdd_cam";
 				regulator-min-microvolt = <700000>;
 				regulator-max-microvolt = <2000000>;
 				regulator-state-mem {
@@ -117,7 +117,7 @@ regulator-state-mem {
 			};
 
 			vcc_ddr: DCDC_REG3 {
-				regulator-name= "vcc_ddr";
+				regulator-name = "vcc_ddr";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-state-mem {
@@ -126,7 +126,7 @@ regulator-state-mem {
 			};
 
 			vcc_io: DCDC_REG4 {
-				regulator-name= "vcc_io";
+				regulator-name = "vcc_io";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
@@ -138,7 +138,7 @@ regulator-state-mem {
 			};
 
 			vdd_10: LDO_REG1 {
-				regulator-name= "vdd_10";
+				regulator-name = "vdd_10";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
@@ -149,7 +149,7 @@ regulator-state-mem {
 			};
 
 			vcc_18: LDO_REG2 {
-				regulator-name= "vcc_18";
+				regulator-name = "vcc_18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
@@ -160,7 +160,7 @@ regulator-state-mem {
 			};
 
 			vdd10_pmu: LDO_REG3 {
-				regulator-name= "vdd10_pmu";
+				regulator-name = "vdd10_pmu";
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-always-on;
diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index c158a7ea86ec..abf3006f0a84 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -748,7 +748,7 @@ sfc_clk: sfc-clk {
 
 		gmac {
 			rmii_pins: rmii-pins {
-				rockchip,pins =	<1 RK_PC5 2 &pcfg_pull_none>,
+				rockchip,pins = <1 RK_PC5 2 &pcfg_pull_none>,
 						<1 RK_PC3 2 &pcfg_pull_none>,
 						<1 RK_PC4 2 &pcfg_pull_none>,
 						<1 RK_PB2 3 &pcfg_pull_none_drv_12ma>,
-- 
2.34.1

