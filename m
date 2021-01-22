Return-Path: <SRS0=hd79=GZ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86306C433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:20:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D37923B09; Fri, 22 Jan 2021 22:20:44 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE17B23A5B
	for <soc@kernel.org>; Fri, 22 Jan 2021 22:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE17B23A5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f53.google.com with SMTP id o17so9690215lfg.4
        for <soc@kernel.org>; Fri, 22 Jan 2021 14:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mzdD2rvgz2rkF7RAoopEQMbI2UQa7wjOviG3Tok8iFw=;
        b=ucYyVyShx/jDx0oPODzuGfbJE59Heh81ezC6UTiLm7572Gcb/q3VFfmtf6oKENjV+N
         PMjgPiFd54auX58vJTfCjy7dHazFOvWTtDDUUwn1WoXfL+taAdI0+/6pOuEecxOKOVbb
         O3lEmZrWAtLIXzP/B+mjNax+MD9xJKy6gdBai1RDldcDbZ3KtWPm1hcMQRdVYNxfIbCB
         C6UFd7lJoAbUFOBsNRGY3+bYT9uwCiIULMonivCwDhY+UlEuDvPbvR10mMWBurZeab4B
         VCWkzqmVIud3U5Hf68ENBh3yir2V6vPHuAALeZ/5sg2U9ObPnpCbJMS4X+SJ+izqQEOg
         YhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mzdD2rvgz2rkF7RAoopEQMbI2UQa7wjOviG3Tok8iFw=;
        b=KYdelgHg7rKui9S5DMN2sL1S2XG/iGt4o/+cEKgzv8k0K0iMHMb2LTwrXW6s5m026f
         o6zXua4cD7Gw6L6mAJL23stQ1DXtA6sbohzUKrwkacN/PcEHgjfWPlx1wPwQqQKjTlxL
         oefqsIVzyIvCXiYvbzxezBgdkVzK09B8Mo/hv7HErtUPnszH+vC5fkF5JWtFNoLjqvbc
         vuhSjqiIcH39ZXR8HzVh0ItwbME1Oh796NTphHmOr2cPJR/rqN6RugHJN0QTyXjZfLuB
         SEo20WsHxkNAMKotnjlu7/4WgmiiaiCBO9wrIH7ieEcBV3/kva40aexSujgfl1duvVwM
         qt4g==
X-Gm-Message-State: AOAM533x1Od0DuPqlwVOg96QS4ck7cE4AP9JFYZ9rrmIX1/gtuiw/jo+
	RAEGV441VS4O3B6Xlx7sRGhhMQ==
X-Google-Smtp-Source: ABdhPJyNdNwp0kiIi1D/MNlM5uZx8D3FYTuWntI7AetzYxjuK2ukMyRMt85uhZftvTES56KhFu7oXw==
X-Received: by 2002:ac2:5d6c:: with SMTP id h12mr3086777lft.482.1611354041770;
        Fri, 22 Jan 2021 14:20:41 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id m26sm1113118ljj.134.2021.01.22.14.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 14:20:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: nomadik: Fix up MMC node names
Date: Fri, 22 Jan 2021 23:20:38 +0100
Message-Id: <20210122222038.2888747-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the node names for the MMC/SD card controller to conform
to the standard node name mmc@..

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this patch directly for
kernel v5.12, I have no other Nomadik patches queued.
---
 arch/arm/boot/dts/ste-nomadik-nhk15.dts    | 2 +-
 arch/arm/boot/dts/ste-nomadik-s8815.dts    | 2 +-
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ste-nomadik-nhk15.dts b/arch/arm/boot/dts/ste-nomadik-nhk15.dts
index 41ed21a4fdc1..8142c017882c 100644
--- a/arch/arm/boot/dts/ste-nomadik-nhk15.dts
+++ b/arch/arm/boot/dts/ste-nomadik-nhk15.dts
@@ -195,7 +195,7 @@ uart0: uart@101fd000 {
 			pinctrl-0 = <&uart0_nhk_mode>;
 			status = "okay";
 		};
-		mmcsd: sdi@101f6000 {
+		mmcsd: mmc@101f6000 {
 			cd-gpios = <&stmpe_gpio44 7 GPIO_ACTIVE_LOW>;
 			wp-gpios = <&stmpe_gpio44 18 GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/ste-nomadik-s8815.dts b/arch/arm/boot/dts/ste-nomadik-s8815.dts
index 4445446fa828..f16314ffbf4b 100644
--- a/arch/arm/boot/dts/ste-nomadik-s8815.dts
+++ b/arch/arm/boot/dts/ste-nomadik-s8815.dts
@@ -139,7 +139,7 @@ uart0: uart@101fd000 {
 			status = "okay";
 		};
 		/* Configure card detect for the uSD slot */
-		mmcsd: sdi@101f6000 {
+		mmc@101f6000 {
 			cd-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
index 4f38aeecadb3..c9b906432341 100644
--- a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
@@ -825,7 +825,7 @@ rtc: rtc@101e8000 {
 			interrupts = <10>;
 		};
 
-		mmcsd: sdi@101f6000 {
+		mmcsd: mmc@101f6000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			reg = <0x101f6000 0x1000>;
 			clocks = <&sdiclk>, <&pclksdi>;
-- 
2.29.2

