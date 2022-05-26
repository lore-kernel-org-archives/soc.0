Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305DCC433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 184CFC34116; Thu, 26 May 2022 20:41:35 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EB11C385A9
	for <soc@kernel.org>; Thu, 26 May 2022 20:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EB11C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id u20so3156653edd.6
        for <soc@kernel.org>; Thu, 26 May 2022 13:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iDU4xBC5nWMNmyCg1ZxLXPk4J0emRkItlM3WQU2JAnA=;
        b=njmUR1XglcBE+JRzoM0q8gmFW5nTrNyW5GkBvAmW48aW5lNqDLKUiJkKeJyy1x020d
         KGucZ+w7ACN9g/i2f2ea68jt6RYW7yUkV+BrvkhA2DzmLVrTr7Z4+1FBdiiKLzh+4XEF
         q+FP5dBGJxACKOw5iEH2HE1S9y/lqskUuAvYsX/GHiO5rd5F5UmB4mASf9ErNDel3+2H
         LMHHjG8ZJzCxDm+Nhc7If0LAgoGhgkY88SGQ5Hih7lVjhIeKtsy95SauXk2c9AQCCU+l
         rZsiSO/L4jpQWNguq1GKmkqUf6NSc6x1TgTLIkPCtsvTvAY48TLYjJ+oH8zan9b6nROK
         A4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iDU4xBC5nWMNmyCg1ZxLXPk4J0emRkItlM3WQU2JAnA=;
        b=riKrFx8lexHcOKo++Kb6iW1YehrTEa09UaPyAbM35HjhRF3fbJBpy8Cv4cSu8vb6aB
         qytwzY4Ttq5kXcdDm4KcEKuLIy9i1YXi9wnWdOTt4ZPIcaw79NXCKUiBuCDFfeUDmJ33
         d2WpB1mOmwnNdMRWMRkgymJJ0Q5Po00pcwmXsqpUKXLg/Ya8Hen0lq6susHQct+5Kk7Z
         XRbSoFIPOaz4n+XP4dbi36q7zdOa2Ne6G6/BxVgaM0/97SDIB14ky1Za+G8EIl9AU2yH
         sfYA8WR+xCJVZ5pb8t4z+bdcxjlUTYYuZd6cxCv8iKbt2F/9j42Z+JvhhR5MMH9nfQbD
         PqkA==
X-Gm-Message-State: AOAM533OUcKDGqiYCU4XOYx+DrfUhcdeB6VRIC2d1Uteelyq8rJlXhNn
	e+gMys7NH+vXwe5ZgwpDxTk9Sg==
X-Google-Smtp-Source: ABdhPJw2cOeuIEGTQNwPOb/HuniCTNdhsvrUqMAxNn50imGeVksbRSzX3nol7SaI2Kgsf0CL2JOy6A==
X-Received: by 2002:a05:6402:1d51:b0:41f:cf6c:35a5 with SMTP id dz17-20020a0564021d5100b0041fcf6c35a5mr42029179edb.25.1653597693596;
        Thu, 26 May 2022 13:41:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y11-20020a170906070b00b006fec28bd09fsm815590ejb.22.2022.05.26.13.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:41:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: aspeed: adjust whitespace around '='
Date: Thu, 26 May 2022 22:41:27 +0200
Message-Id: <20220526204127.831853-1-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts | 6 +++---
 arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts       | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
index 61bc74b423cf..a5e64ccc2b3a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-portwell-neptune.dts
@@ -24,17 +24,17 @@ memory@80000000 {
 	leds {
 		compatible = "gpio-leds";
 		postcode0 {
-			label="BMC_UP";
+			label = "BMC_UP";
 			gpios = <&gpio ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 		postcode1 {
-			label="BMC_HB";
+			label = "BMC_HB";
 			gpios = <&gpio ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 		postcode2 {
-			label="FAULT";
+			label = "FAULT";
 			gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
 		};
 		// postcode3-7 are GPIOH3-H7
diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
index 69e1bd256271..46cbba6305b8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-s6q.dts
@@ -65,19 +65,19 @@ leds {
 		compatible = "gpio-leds";
 
 		BMC_HEARTBEAT_N {
-			label="BMC_HEARTBEAT_N";
+			label = "BMC_HEARTBEAT_N";
 			gpios = <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 
 		BMC_LED_STATUS_AMBER_N {
-			label="BMC_LED_STATUS_AMBER_N";
+			label = "BMC_LED_STATUS_AMBER_N";
 			gpios = <&gpio0 ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
 
 		FM_ID_LED_N {
-			label="FM_ID_LED_N";
+			label = "FM_ID_LED_N";
 			gpios = <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
 			default-state = "off";
 		};
-- 
2.34.1

