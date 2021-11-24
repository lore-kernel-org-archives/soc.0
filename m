Return-Path: <SRS0=HRIu=QL=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3A1C433F5
	for <soc@archiver.kernel.org>; Wed, 24 Nov 2021 08:51:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 703416101A; Wed, 24 Nov 2021 08:51:05 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D62060FE6
	for <soc@kernel.org>; Wed, 24 Nov 2021 08:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D62060FE6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 609EB3F1AC
	for <soc@kernel.org>; Wed, 24 Nov 2021 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637743863;
	bh=3ZoUW9jdN7IytTzxTuRgqOAoWQMVQDOL0U9ecy5BDjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=JgI0T//Unt1K5y1UUSnSpUZ6zPZYL+7NpFVajTvcLbiGJX7NAojTznOC49yXcnQXp
	 86e9xgxT5VTUmkBsxaX5iXTr6BImVHXflT+E6dTbbNWYaXcWl0WfI4VFFc52Pjd5No
	 QHIrU8Dk5za+oiKltRkSF0Bg3uTIw940sFUryvQaJvDkQtKclF87UJ/uCT3wPqKvy/
	 +/3vnfwyVag9IePrK/wfi9csIuAVzUIycRzfJhZ6VJ5g1945iAUfLuh3CULJWIcIaw
	 ABlMtnB5xJVMcXeTjWqkcYVX8d4nH6CAFCCHkHi16X9Idpzgo0LabOqGZmj6m80Oew
	 SV7t+qIgwxUHw==
Received: by mail-lf1-f71.google.com with SMTP id bi30-20020a0565120e9e00b00415d0e471e0so1052210lfb.19
        for <soc@kernel.org>; Wed, 24 Nov 2021 00:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ZoUW9jdN7IytTzxTuRgqOAoWQMVQDOL0U9ecy5BDjQ=;
        b=BiHHbSW6FqY2c2E2ChSdJVGzUi6lf5WreFF0sCDCW7LkhtO/Y8RLsdTxnHUmx31kn7
         hg1x20yc8EO0FBP28NtJ/Gsj5OG8wmSLcFHbBO2V2xK0rEMk5tJMueGVlaqGBjpwi/fP
         eBfKCkjGU4p9VBCQKcL+u/+WdT2g2L8P3YQbkteF9e+hB5Meqyk1Gds9kuVnAect6UAi
         dmgr+T6Jwm9sXQVeRRGaTOfF20GJjtMis39I3IezR6H6rVqx6ti50N+DwHOkyBsOwmwR
         AwWO3CyI7xCPJKb0qTS9SDuZ63A3jSVEyfQ+zlvNbxuQ807Z0KWd6/HUWkAGv+gRfBel
         LWWA==
X-Gm-Message-State: AOAM532jWbw2trTiVsUYtcE268zMWNAQBnSPq158212I03hiSKNIqu2X
	SZHUNmLfGzesbOW0vvMaz7AJNTLTREj8DU+wuQz9KcMRvLi57VvJJLj1IhbFTJbiclv/DWvwqcC
	FtytzCgk/Du2YZicOU1Shung=
X-Received: by 2002:a05:6512:1113:: with SMTP id l19mr12895902lfg.184.1637743861867;
        Wed, 24 Nov 2021 00:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHas2DajMvWAwkxoga5XBtzlcLdJgRnPR660dVckM/cTVuIGH3bM2z5YbQG4vuU+UHTv5tWA==
X-Received: by 2002:a05:6512:1113:: with SMTP id l19mr12895886lfg.184.1637743861703;
        Wed, 24 Nov 2021 00:51:01 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id t12sm1742952ljg.63.2021.11.24.00.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:51:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Chanho Park <chanho61.park@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] arm64: dts: exynos: drop samsung,ufs-shareability-reg-offset in ExynosAutov9
Date: Wed, 24 Nov 2021 09:50:41 +0100
Message-Id: <20211124085042.9649-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211124085042.9649-1-krzysztof.kozlowski@canonical.com>
References: <20211124085042.9649-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chanho Park <chanho61.park@samsung.com>

samsung,ufs-shareability-reg-offset is not necessary anymore since it
was integrated into the second argument of samsung,sysreg.

Fixes: 31bbac5263aa ("arm64: dts: exynos: add initial support for exynosautov9 SoC")
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Link: https://lore.kernel.org/r/20211102064826.15796-1-chanho61.park@samsung.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 3e4727344b4a..a960c0bc2dba 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -296,8 +296,7 @@ ufs_0: ufs0@17e00000 {
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			phys = <&ufs_0_phy>;
 			phy-names = "ufs-phy";
-			samsung,sysreg = <&syscon_fsys2>;
-			samsung,ufs-shareability-reg-offset = <0x710>;
+			samsung,sysreg = <&syscon_fsys2 0x710>;
 			status = "disabled";
 		};
 	};
-- 
2.32.0

