Return-Path: <SRS0=Upr0=AH=gmail.com=aweber.kernel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ADCC77B7A
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 10:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7AE38C433D2; Sun, 16 Apr 2023 10:18:25 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A8D0C43322;
	Sun, 16 Apr 2023 10:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9A8D0C43322
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-50489b16e6aso5105532a12.1;
        Sun, 16 Apr 2023 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681640304; x=1684232304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Vw7IkhYneCykALUpZzpj7USB2Ld/fNOUvy0zl1WvSk=;
        b=d3y8JwMRUwKh1tdSMa3QufUNZpkVuowkFvs4vXbquxrQmW8u3zh+YVaqidheSd18Yh
         sSXeivwOOH8D+8PiCzIwl0EluBzr+9LDHM11AiA/JtHuqWxwbIi1PP50x1HeBbs+dIx+
         GAR9wetWmRxOwNik60THfZ4owhwjEkCv9bHYWlG2oLvny7tsaMg5681VpCrmwlljWfMv
         /wvCkvIWlVWZ39PtNCy0m59vaZ/dl71wsBwPGfsJlJRxSzm0LqR8Cy8U4iSU06DUsyE/
         gQLfm8LhsjWqkWVFZxRz8gZjMnreGOJTOz/pjnzDOzrXfhsYMnFiuabKdZgsoL0zsaeX
         PaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681640304; x=1684232304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Vw7IkhYneCykALUpZzpj7USB2Ld/fNOUvy0zl1WvSk=;
        b=EbtVNfNasCfCOC5iUCFvUicJOoPiqlj5HK3m/yNPGHEVOu19VrF6F2PR+Gm9M7AvKN
         EmpnNka4Wcxhyr3pqe+t5/lGd15D4qmnAa3OndFJ6z/c6N7zppjSjl4/PmwybjtDLEDw
         CXBlY3GwQS5lQYO1u6I+8u4zNZC+QjuPRhshM4xUHgoTfB8/05IutGC99YaeBpQzAvbM
         taw1u6Dhp3GawdK3wbOYTSmsooXTppEhjuIejTv4Jx+rLkyiA44FH28i0YUFp9PpnBeK
         LqsBJIhs8lOjbSkwyjIhhVZ8KCtIGu0Jz+3WfGdEMnANPlgoacMSXLel5eG5ieVVdSzv
         s+fQ==
X-Gm-Message-State: AAQBX9eAqaU0xgz2RljhjJwL3ebkDOzJYk16LJsh7ll9QdBGg3phxP5s
	G/68VtEBXAMOvgR3fwFxgj0=
X-Google-Smtp-Source: AKy350baF3wt8f4vZvCbFp7IBlN80m1snCFuzJDRbGXEHsXmYWJBHgGmsrQ4P3yYeHwlqivEcl086w==
X-Received: by 2002:a05:6402:1b02:b0:501:d4f9:3141 with SMTP id by2-20020a0564021b0200b00501d4f93141mr11301812edb.32.1681640303935;
        Sun, 16 Apr 2023 03:18:23 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl. [83.8.121.70])
        by smtp.gmail.com with ESMTPSA id r20-20020a056402019400b0050476da5160sm4427443edv.45.2023.04.16.03.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 03:18:23 -0700 (PDT)
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
Subject: [PATCH 08/12] Revert "phy: Remove SOC_EXYNOS4212 dep. from PHY_EXYNOS4X12_USB"
Date: Sun, 16 Apr 2023 12:16:20 +0200
Message-Id: <20230416101624.15866-9-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416101624.15866-1-aweber.kernel@gmail.com>
References: <20230416101624.15866-1-aweber.kernel@gmail.com>
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

