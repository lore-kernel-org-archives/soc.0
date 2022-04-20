Return-Path: <SRS0=wXmp=U6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977FEC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Apr 2022 10:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E99AC385AB; Wed, 20 Apr 2022 10:47:20 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8EC5C385AA
	for <soc@kernel.org>; Wed, 20 Apr 2022 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8EC5C385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id s18so2761999ejr.0
        for <soc@kernel.org>; Wed, 20 Apr 2022 03:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcpYqRaU49XKqh0Z0sSXhDxB3o3VF6wDafoLfTVp4EQ=;
        b=TllbobzAtOeBEXWQjxWZwmHDv/7A+77wdjCWcGGlbLmwQnEk+Zd8uBxoUl8qMoYIvt
         GP6zRKxeVe+L2gaGMMHvIvIrU1SHOX/jNhZ6zrtqzUqhzFoM/yxmyUM0bMSHCDRMiJux
         Gf/26FTMxYbd+jdvyZcC/5pABqDpE6CKw16ps+kIPS8tkE0WcSA3rhBy7wzu3ixbt4Hp
         gXMk7EaNo+5uQkHTqZJEkFrh14utTtQ0fDC0Vqv+9JHXyDgQGfF2OfNK2SJy0gb37pDx
         AVruYFb2E/K95YlR0+UCI1vLc6tb+2usEeGEfigufEujzTpvXdAr8e9dyLKT90vLTSC6
         61tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcpYqRaU49XKqh0Z0sSXhDxB3o3VF6wDafoLfTVp4EQ=;
        b=cyqt/L2g+PHETPdhIno0MntSc3hkuUAJp8z+CUf5mq2piX4I4Osh5LCUqH9RrkSnIC
         jMFY/gOe6dg/uG4ZKziTPsyON+GBe2G2xbwy6XhuC37yml4vx4Wp0vxusFFZPI+jyYLa
         7pC6aaxHtIdvaEjjhmTWd8nDhqAmyIAKiOJQ/C2/akYhH7pXpOxbRxa8eMLhEuCl3uc0
         vYuw04uSq8nOxHoIUByL0YUQoAw9N1FonuC1/n7N0WoZE4sBeUETVPPHBFLQkt9OwhS1
         gDDD/JosEJ1yWbGxgAdh1hvhg5ZJRFoAkahMZtM5VQXk0JbuxVVMYHbb2u0y7KSnhO3l
         Zdyg==
X-Gm-Message-State: AOAM533XAlmwPn4IvdiPo9pegK17AhUT/iJfsGQBlKDGT+sO7EKkBU/x
	McQeHZw6iSNzEEGk8DzRSSnGxg==
X-Google-Smtp-Source: ABdhPJy9OVgwcawWRlYVZ5WxCEw/1/2nlUmelZjjBlqNclDd2qstERYLUEf0WaDM3tW8fI/yuSRHvA==
X-Received: by 2002:a17:906:6a1c:b0:6eb:d76c:e835 with SMTP id qw28-20020a1709066a1c00b006ebd76ce835mr18773642ejc.15.1650451637094;
        Wed, 20 Apr 2022 03:47:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090622ce00b006e898c912e5sm6583019eja.217.2022.04.20.03.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 03:47:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: add Bug entry for Samsung and memory controller drivers
Date: Wed, 20 Apr 2022 12:47:08 +0200
Message-Id: <20220420104708.106738-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Bug sections, indicating preferred mailing method for bug
reports, to Samsung SoC related entries and memory controller drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cfe5a9acf3f..2d746723306a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2645,6 +2645,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.libera.chat/linux-exynos
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
+B:	mailto:linux-samsung-soc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
 F:	Documentation/arm/samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
@@ -11989,6 +11990,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-pm@vger.kernel.org
 S:	Supported
+B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
 F:	Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
 F:	drivers/power/supply/max14577_charger.c
@@ -12000,6 +12002,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
+B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/*/maxim,max14577.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77693.yaml
@@ -12693,6 +12696,7 @@ MEMORY CONTROLLER DRIVERS
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
+B:	mailto:krzysztof.kozlowski@linaro.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
 F:	Documentation/devicetree/bindings/memory-controllers/
 F:	drivers/memory/
@@ -15624,6 +15628,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
 C:	irc://irc.libera.chat/linux-exynos
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
+B:	mailto:linux-samsung-soc@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
 F:	Documentation/devicetree/bindings/pinctrl/samsung,pinctrl*yaml
 F:	drivers/pinctrl/samsung/
@@ -17357,6 +17362,7 @@ M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
+B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/sound/samsung*
 F:	sound/soc/samsung/
 
@@ -17401,6 +17407,7 @@ M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
+B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s5m*.yaml
-- 
2.32.0

