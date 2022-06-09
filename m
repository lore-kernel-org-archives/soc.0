Return-Path: <SRS0=qwHo=WQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C34C433EF
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D7A5C3411B; Thu,  9 Jun 2022 11:39:52 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 426E3C341C0
	for <soc@kernel.org>; Thu,  9 Jun 2022 11:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 426E3C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id v1so36211171ejg.13
        for <soc@kernel.org>; Thu, 09 Jun 2022 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5S/RV9AELwOaDCH5atX+3Vv8RTm/1jcts99iBeZwt4M=;
        b=VybmEKPiOUE64UwmqZtxQg6qm2ZaPnWtbGUDCGge+zC1GdHHbotVW725SnVA697hd2
         FtuV8Rx86MN3t/2yarLDYZH5tTT4XhvyoCVXprV1T8K8Gvk9vyuHriR1OpiripOoHeJy
         tzVmjuddPAyiMSGjDQR9y5o1EJzeKNNtm/zdi8GiGfmH/zDlaQJe7FX0rF7lRqgZsWhf
         jEzvuGbwAxjyaa5n47Sanp8+BQ8r3KfDS3mj0qyfRqsSdLgd6OyE4EhFq/WpqGHT7ZMi
         fcPNx3nwTrTvG6lefsjWa2Zid9j1Q7SPajzjcOOj33/tYATtCp0tAxlgY0mxKg0/qiH3
         VspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5S/RV9AELwOaDCH5atX+3Vv8RTm/1jcts99iBeZwt4M=;
        b=Jz8LZDzQlNWBM48C6xKLFLyOtrYoOxaTPrn7ZG5K39OSsZDisAnGalWE72ScxwJfCG
         T781Bkn9r4AoTQnQuHBgq8qaTNK7L9gD6BYClr2Ubp47ROTwX7sEsk51yc2c2KtW+t9T
         kmLgTRhf4T8oXO9esXE+xL/1Khl80udJV3mDyqxQcjUZy3my8NQ8r+vVpn+LlW6kcgJJ
         T5gO9xKj6mLBH0hV+aX1/rBo6VKdhZER0xXw9z98R1PmV5DnJCvdYLUzUQO4XaLGULDH
         ZIFuP3PcJueiD8W6gtvygxlE3QcfHsqPa1s2WnuiauQDUqfIl4FU3ehIXxPZv75/Yd3u
         4TrA==
X-Gm-Message-State: AOAM532QAnvmM8YDYn0/YrdUYknbGJkVXX6SgxacFc5Ck65Zq1Jm3FIQ
	uFkPBvI0jgixztaLsniRi3qgiQ==
X-Google-Smtp-Source: ABdhPJyg6YBir+KkL8OFmNyegS0qrWC+mP4wqaObXruXdNrN0aPT77oBLvMMt3CU39pXV0dnJbav+g==
X-Received: by 2002:a17:907:7ea9:b0:6fe:d412:ec2c with SMTP id qb41-20020a1709077ea900b006fed412ec2cmr35560777ejc.613.1654774789448;
        Thu, 09 Jun 2022 04:39:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906528a00b0070a80f03a44sm9460415ejm.119.2022.06.09.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 14/48] arm64: dts: freescale: align led node names with dtschema
Date: Thu,  9 Jun 2022 13:39:33 +0200
Message-Id: <20220609113938.380466-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The node names should be generic and DT schema expects certain pattern
with 'led'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index aa38f5379558..ef6c8967533e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -52,17 +52,17 @@ button-admin {
 	leds {
 		compatible = "gpio-leds";
 
-		sfp1down {
+		led-0 {
 			label = "ten64:green:sfp1:down";
 			gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
 		};
 
-		sfp2up {
+		led-1 {
 			label = "ten64:green:sfp2:up";
 			gpios = <&gpio3 12 GPIO_ACTIVE_HIGH>;
 		};
 
-		admin {
+		led-2 {
 			label = "ten64:admin";
 			gpios = <&sfpgpio 12 GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
index 92eaf4ef4563..c97f4e06ae5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
@@ -20,13 +20,13 @@ leds {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_led>;
 
-		user1 {
+		led-1 {
 			label = "TestLed601";
 			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "mmc0";
 		};
 
-		user2 {
+		led-2 {
 			label = "TestLed602";
 			gpios = <&gpio4 10 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
-- 
2.34.1

