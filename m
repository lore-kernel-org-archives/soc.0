Return-Path: <SRS0=312b=AW=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6BEC7EE2D
	for <soc@archiver.kernel.org>; Mon,  1 May 2023 19:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 338C2C433D2; Mon,  1 May 2023 19:55:50 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35D55C433A0;
	Mon,  1 May 2023 19:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35D55C433A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-956eacbe651so588230266b.3;
        Mon, 01 May 2023 12:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682970947; x=1685562947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVl+1ldEbgG0bY/nnbA49+7exJ4XMFuwhoQlwV/juHE=;
        b=m/BskhkoAc99W7NhroNRS7UdT5dY/EE+WENCsL3WAWHaSFrWoKbKUmi+F8+FlxcGo9
         keLARdtcbUPcdF0MYORoWNIbIMJ/fJ5AJnzU52Y60zydKrykYJBxlZyRp7iIAj/Ni8To
         5r4EO4/XPi+g6BD1hQRfwzbWwS8zHVDCiaVZ3rXFFCfPae3YI1tYFWw9TdjOqGNa6dcG
         NX2hlHVCDAzap072Xh5DzwMO0RbeKi+E4SKP5cu/pCcocudL65n4F9q9MMj3hr2l+dUr
         a6iy6HG4zRDqLqIN/hoX6eeSacwKjIL7/f2yOvCymRG+2w4Nu/hH7da9WD/ejyglAQVy
         tzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682970947; x=1685562947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVl+1ldEbgG0bY/nnbA49+7exJ4XMFuwhoQlwV/juHE=;
        b=MY+plzSghUoWn/IFihcSUn833eNBCZbzLbGzsytHgXEnDusJRiv4+Kc2wiIsi59/7b
         +s++X2pUEjRooX0kpEitTTp4nT8u0Q0+21UdFZjbpAUQzXQ4Hz9g69t9HVkaXexxF49d
         oUD/8yqeVkfZCuLAsYbnNNWhQhHVMf8vh3DBDR/WpaMEcEc/yAM3GBGM22cDKrc4YA0l
         1gfS7CrJtlrazyiHVNFj7ENGbm9ywtOW2xaoAB+bjc1Fmkxu2dwaXttKRopA18u/uccT
         rapIp1FWDROb1JnCFu55ONFsCGGS5QmP51RehxWVCzPCGRedCy4l/f8aY3EB6t9lbpRz
         gBdg==
X-Gm-Message-State: AC+VfDzrUD75LCDYYpS3pfNC87S2RAPMfQUGnUzu042oaroaICvZcw9P
	LKY5tSbaGuPjlmIu3iSTrzc=
X-Google-Smtp-Source: ACHHUZ7jrkT0xfHVPcIzTIZhHTNk3x/WPV+vnt2Yz0ptrGIMq9z5ndA7ZxekxkLXc/Qxc166p+NkbA==
X-Received: by 2002:a17:906:6a15:b0:94f:a309:67b7 with SMTP id qw21-20020a1709066a1500b0094fa30967b7mr12450638ejc.56.1682970947470;
        Mon, 01 May 2023 12:55:47 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl. [83.8.115.30])
        by smtp.gmail.com with ESMTPSA id og36-20020a1709071de400b009600ce4fb53sm6333650ejc.37.2023.05.01.12.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:55:47 -0700 (PDT)
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
Subject: [PATCH v3 08/13] Revert "phy: Remove SOC_EXYNOS4212 dep. from PHY_EXYNOS4X12_USB"
Date: Mon,  1 May 2023 21:55:20 +0200
Message-Id: <20230501195525.6268-9-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501195525.6268-1-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for the Exynos4212 SoC was originally dropped as there were
no boards using it. We will be adding a device that uses it, so add
it back.

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
2.40.1

