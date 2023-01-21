Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E00FC38142
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 05654C4339C; Sat, 21 Jan 2023 20:19:01 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D7A0C433EF;
	Sat, 21 Jan 2023 20:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D7A0C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 18so10393387edw.7;
        Sat, 21 Jan 2023 12:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwQ17Lcm2IqVHFAnePP290nHJ1hZODiXeBdsdtLFjw0=;
        b=FUXXhdqANULg7ZotC2pLpEfJqS2F0W8GKHoIPlLcjHFCFPLSZUSgepsZotVvY7eGMw
         5vVvC2b/qMx4OpJdm/r+6AQoChRHf/F/VaUPQuVVK76kGGpDfq2Hisa5WqrCx3R/agid
         2KsW5yhLhIBWOJPTmMtEaaCN3RFEEjjNF4td9mtVXOhrG/5Ypr6ZKDAlqhcSyDOMxJHe
         HdrA9qw7XbzOcwrGblNwXzvIaKKJc4Q3n/7g3eAYibqH2FOF1ILhaPeS/NGGOrntOQXg
         YJmqURb56UN4YeLsT7Q1KgbLqQQ/6RJGXA0dV3iqfvOCiwv6carXW6TNedH9GtCCVkIj
         bWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwQ17Lcm2IqVHFAnePP290nHJ1hZODiXeBdsdtLFjw0=;
        b=H/3euh04wY0vkgWo25sOYob62cQDjX6Mw/iNokXsyBWgWtCbs/rlrMXRpdtDMZgdO3
         BeHqjHTK5cLBM0yff4PkrbzrWKcC45Uu97EU73QzNznMlbwyDGNy2JhkYR7EXLilrM6M
         5vtgi9wB/HH912lqFIFnSIIQlj6kvRE3/BpQIP6jDaZZ+1MUXxGUzEp47hDeGAbziOSF
         rlZ1DJ5ztH4xH2UltaVoWteLLefqbAJ15IUZXVLoUPwUVhnoMVYUdtju+myCwz8ktzEc
         19rExHiYSIHTVyO4/MxHLpn179yi4XT9mTJXYc28tKg0TiA8zb+QFehRCdvw6Opxl6l2
         wODg==
X-Gm-Message-State: AFqh2kpmW7yw1eiqW98zSN5Zt+uxqess9pds22MP0MqtaYl1Ms9szSK+
	0I9OyB3655/WjzNNEsW7sI0=
X-Google-Smtp-Source: AMrXdXvGt++PN5EjA0ztBQb2c/gjgcgD4qFpNIX0JHL6I/yrpki+hm6vVeEIFzUneViDHYXRYrObXA==
X-Received: by 2002:a05:6402:1cb2:b0:49e:f052:d9d3 with SMTP id cz18-20020a0564021cb200b0049ef052d9d3mr4793877edb.15.1674332338445;
        Sat, 21 Jan 2023 12:18:58 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id i23-20020a50fc17000000b0047c6f3eccb2sm19203423edr.50.2023.01.21.12.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:18:58 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 1/2] arm: dts: exynos5420: Use Exynos5420 compatible for the MIPI video phy
Date: Sat, 21 Jan 2023 22:18:42 +0200
Message-Id: <20230121201844.46872-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121201844.46872-1-markuss.broks@gmail.com>
References: <20230121201844.46872-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some reason, the driver adding support for Exynos5420 MIPI phy
back in 2016 wasn't used on Exynos5420, which caused a kernel panic.
Add the proper compatible for it.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9f2523a873d9..62263eb91b3c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -592,7 +592,7 @@ dp_phy: dp-video-phy {
 		};
 
 		mipi_phy: mipi-video-phy {
-			compatible = "samsung,s5pv210-mipi-video-phy";
+			compatible = "samsung,exynos5420-mipi-video-phy";
 			syscon = <&pmu_system_controller>;
 			#phy-cells = <1>;
 		};
-- 
2.39.0

