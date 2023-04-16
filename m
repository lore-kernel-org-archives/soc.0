Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB097C77B7A
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 13:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD503C433AA; Sun, 16 Apr 2023 13:35:52 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC94DC433D2;
	Sun, 16 Apr 2023 13:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC94DC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id c9so18616369ejz.1;
        Sun, 16 Apr 2023 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681652151; x=1684244151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Vw7IkhYneCykALUpZzpj7USB2Ld/fNOUvy0zl1WvSk=;
        b=cRF1bWrdsBz4f28aZ73WeavD7TVKFP4oorqaP9bWG8O8IiWQMq6oY9JC4JbyW/RXbI
         pkAHJvSNy+9TOSdXB4wPGHxW/STgx2xQCxCS27jEE/M1kjEgCuCakrG5TfRRvPLkA/ku
         1E+4amkPNqjoEeluN/gFoP5QOmn6tt33rYhSIQuGUVve2Dg6r73qDcTd6dcZ3bU3RaFW
         h0wm+l0CGb4J2vvOhwEui7B4ekSLqcRt+JzITkXsBir50i1qqZ1S1A4BYyV/nBVnei0l
         GKmkD9EbNNZqQQggx6rN0Rde62raOEqByS31trHH0ssCuKNBxHuw2NjgHOaN8Vi1ByVK
         34sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681652151; x=1684244151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Vw7IkhYneCykALUpZzpj7USB2Ld/fNOUvy0zl1WvSk=;
        b=YbIrPJmRJhAUy760+5ymIkV+oCj3ZAHyvJOEoT5k1VAYWopZeAd+1xsngox/s2CcoL
         xJIhUkywWhJzN7Ju5YkPXnvSfRL0SEdIIuEWEcco8pC7lz41A/S7ArDuYt4HC0YkIOVX
         s6Y47KWPxOOy9jCbNYcbUdCmKyOhBGw3Bmf5pbbbLSMrzoHidqkFbc++l9AlCfZ5WQRD
         SgSDWfcyhmgdZOiW/GHz74CDrbay4HS0rsTY+dBqqlGd6rhvuvOW2BXHnVGJFm1wfCP1
         ifYQPc/+Zu87UcwSNn3YCNECDvikRXZWJYizCakF15HzrUBU1BLnKMriHsgpIAXxuQ4v
         J2QA==
X-Gm-Message-State: AAQBX9f5S9SNa7+nS4tyeXqJ+B0y4qpVd63yIp9GpR36G/j6gvOwcZ4D
	1Hd/DZ7YDRDHek0NJaiMBxU=
X-Google-Smtp-Source: AKy350b1tv+Q7WC1YUJEbb+ngTtMSVvXW1d2BFu4xZaTGXGIYcrGI3kWjHi0WWPUS/315j1JDD0IHw==
X-Received: by 2002:a17:906:fe4d:b0:94f:6218:191e with SMTP id wz13-20020a170906fe4d00b0094f6218191emr1084789ejb.20.1681652151296;
        Sun, 16 Apr 2023 06:35:51 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id gn23-20020a1709070d1700b009373f1b5c4esm5122958ejc.161.2023.04.16.06.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 06:35:50 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 08/12] Revert "phy: Remove SOC_EXYNOS4212 dep. from PHY_EXYNOS4X12_USB"
Date: Sun, 16 Apr 2023 15:34:18 +0200
Message-Id: <20230416133422.1949-9-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416133422.1949-1-aweber.kernel@gmail.com>
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform was originally dropped in commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), as there were
no boards using it.

We will be adding a device that uses it, so add it back.

This reverts commit fee7e1d50c6e6da1d99035181ba5a5c88f5bb526.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/phy/samsung/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index 3ccaabf2850a..f10afa3d7ff5 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -59,7 +59,7 @@ config PHY_EXYNOS4210_USB2
 config PHY_EXYNOS4X12_USB2
 	bool
 	depends on PHY_SAMSUNG_USB2
-	default SOC_EXYNOS3250 || SOC_EXYNOS4412
+	default SOC_EXYNOS3250 || SOC_EXYNOS4212 || SOC_EXYNOS4412
 
 config PHY_EXYNOS5250_USB2
 	bool
-- 
2.40.0

