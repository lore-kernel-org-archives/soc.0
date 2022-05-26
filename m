Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C6C433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03040C34116; Thu, 26 May 2022 20:41:06 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B305C385B8
	for <soc@kernel.org>; Thu, 26 May 2022 20:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0B305C385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id u20so3156653edd.6
        for <soc@kernel.org>; Thu, 26 May 2022 13:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FG32quRdmb4L/HcSO6RP7C4liXSjCaPEAfDKdvMB5EA=;
        b=oQENf9F2y91hwmI2NQjA4MUdDMbDNCVRMpQ0gTwtMMGdQsMzZtArtWGca1ytuRnaAH
         BhBiSCeklPSR1offhy1ZnhKBGt8gGCgJjs/ADA7TeKR3gqTT+b+gGdetDtbwDES2lrpN
         i7sl2jtQ0GruOUJl1kv9Y1hdKU3jcxRpquoomW31vooAXHAYtuhcLpxVRaDS4z97yeMG
         +0gbEzRFYPCBmNRFk47ck7g16o3OxmPecrV4PtIGT5kVCt7AJrU8DWCzLDC1lV4o1P9l
         c60f73TtUeBWYuXsHIlyxdX70FbFyv2aCu3yv8DmJ6iB3N3T43YJ+ml3Jr6TakH5U5YM
         Drew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FG32quRdmb4L/HcSO6RP7C4liXSjCaPEAfDKdvMB5EA=;
        b=iT5d6XQp8U3p8zyYbnJHi6VROHHGqZhHGorh3wfh1akXsUe5QuQXiZp6Rl39kfYij6
         fjEqrukDilPq3grPYOAF3OrbGvbvDRAtZOdxNHlwvXsty7qjTmtXOWJZVpu7fpq4juPC
         e+Pr4JRv3+/WYDEUMlRHCYBHgI3hQN2v7eNpMnwFeYgXN5UwPqOLCaqnRpn9d4Zpr9JO
         gPUqjut8KZNrnylMygPbmyhU+amAv91ovSDAv8KPzmSe/Im8h/e0AEbXiy7O5VohNJAt
         nsNiv5JZ1HPEujovr6r0AVAmwCaZ/L2XgMbqbTRVpbJUTpu+6jWG5j5ZbjJSqlYlIRdE
         H8VQ==
X-Gm-Message-State: AOAM533XisreI3RjNGLNceQObj5k25jcR752yBtUVcHXVSwtePYSVM2A
	I7OdYNr2PleA7UTHgg3QXR/1gg==
X-Google-Smtp-Source: ABdhPJxE42lHG/goCri8i5lqNiJ5YCP0nXE1k5un1U2V8/0pyn4A/lrspTOqoo4o+2LEi/0oVt17ZQ==
X-Received: by 2002:a05:6402:347:b0:42b:c4e3:897e with SMTP id r7-20020a056402034700b0042bc4e3897emr12082472edw.200.1653597663401;
        Thu, 26 May 2022 13:41:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d3-20020a1709063ec300b006fee2bdf6c6sm811327ejj.169.2022.05.26.13.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:41:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: axm: adjust whitespace around '='
Date: Thu, 26 May 2022 22:41:00 +0200
Message-Id: <20220526204100.831742-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/axm5516-cpus.dtsi | 32 ++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/axm5516-cpus.dtsi b/arch/arm/boot/dts/axm5516-cpus.dtsi
index 3bcf4e0a3c85..f13ef80b6637 100644
--- a/arch/arm/boot/dts/axm5516-cpus.dtsi
+++ b/arch/arm/boot/dts/axm5516-cpus.dtsi
@@ -73,7 +73,7 @@ CPU0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x00>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -81,7 +81,7 @@ CPU1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x01>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -89,7 +89,7 @@ CPU2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x02>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -97,7 +97,7 @@ CPU3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x03>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -105,7 +105,7 @@ CPU4: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x100>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -113,7 +113,7 @@ CPU5: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x101>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -121,7 +121,7 @@ CPU6: cpu@102 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x102>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -129,7 +129,7 @@ CPU7: cpu@103 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x103>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -137,7 +137,7 @@ CPU8: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x200>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -145,7 +145,7 @@ CPU9: cpu@201 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x201>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -153,7 +153,7 @@ CPU10: cpu@202 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x202>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -161,7 +161,7 @@ CPU11: cpu@203 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x203>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -169,7 +169,7 @@ CPU12: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x300>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -177,7 +177,7 @@ CPU13: cpu@301 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x301>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -185,7 +185,7 @@ CPU14: cpu@302 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x302>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 
@@ -193,7 +193,7 @@ CPU15: cpu@303 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a15";
 			reg = <0x303>;
-			clock-frequency= <1400000000>;
+			clock-frequency = <1400000000>;
 			cpu-release-addr = <0>; // Fixed by the boot loader
 		};
 	};
-- 
2.34.1

