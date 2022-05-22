Return-Path: <SRS0=+qjS=V6=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B8BC433F5
	for <soc@archiver.kernel.org>; Sun, 22 May 2022 07:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75CFAC34113; Sun, 22 May 2022 07:26:02 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F05AC385AA
	for <soc@kernel.org>; Sun, 22 May 2022 07:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F05AC385AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id r3so6993570ljd.7
        for <soc@kernel.org>; Sun, 22 May 2022 00:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bClLLZOEkS78eDSYlE4FkbbbTc9pKAb4suzwGlPbP/4=;
        b=Pd29BUuNBc4QsRgP1tKdp1G1GgkzRidqQef41FKtVLSrI5aD8SZ0OrH3tUKB8lk3sC
         oc9YmBYMBz4+5nmJJ7+fH1EDkq2O7NGD0IE7gQym2BP5SlB94djSmL94e8JGEFuSIp+r
         JTRE+eoyDUYxYSN1cu9znFtWz0rWu6/Za5/i6bR7ARoDZii0pkVAONour0fw29BrMrLc
         FgKZpSpMG9hrC6ipB3dlmT7goF+nec+FGn6+/6/yCIwYFQHxhZe1B/052n//lvRog4tM
         nkspfVimR0ryGPb7ZfzjREYi5iJB6PDwkfqT1brDmUQGLeKfoO6sPyjpmachD6AJgDFK
         u2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bClLLZOEkS78eDSYlE4FkbbbTc9pKAb4suzwGlPbP/4=;
        b=saUpGw69jTAvyz6rLOhO7HraaLSX6FxbZTZGXn62NK8bJUZadyCrBoc9qWbmCRtFwY
         Lw+Kq3TfervAUdD6vH2gC2hZCDurhAh2WpovNasjZhr45Cz2Bt3MfjRByecUOwfJ9oXd
         /xfjtpimw1Z7NpSe036WiafOzKri3boS2+BPuKtLtPpE8fgfO0U7NOhXjCivmcv71tgK
         eNGNz7ji6/Y5NfpfoCeA2ka5DG3rxaE8jdPUN5yJ5jNgIDbIqWCkyr8fqVYw96EYUZ/e
         2nflnrPOlv8G2afHpxNEW0ltDesoRYaHw0KDbAibdgIxkJMUFROHwQWhuQP2ca4QGBeZ
         kupQ==
X-Gm-Message-State: AOAM5334Rdw1lAEatuQQCUxrj4RGV4eKED4g+tDY1gDl5ATB4Dhdv5kp
	lT9xU8kRnWH0KionLDKI6lbD7w==
X-Google-Smtp-Source: ABdhPJyUKgT4NniB9xIrosW/5q1kq5Gm8Fu3ANqd0BioQHnQjIyo3fdiH42XXWwZSu3o1vg6zz4/yA==
X-Received: by 2002:a2e:6d12:0:b0:253:e3b9:a56e with SMTP id i18-20020a2e6d12000000b00253e3b9a56emr2788678ljc.103.1653204359468;
        Sun, 22 May 2022 00:25:59 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e86ca000000b00253dffc82b5sm876688ljj.71.2022.05.22.00.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 00:25:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ARM: ixp4xx: Consolidate Kconfig fixing issue
Date: Sun, 22 May 2022 09:23:56 +0200
Message-Id: <20220522072356.34062-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IXP4xx Kconfig we ended up with for mach-ixp4xx creates
as kismet warning:

   WARNING: unmet direct dependencies detected for GPIO_IXP4XX
     Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && ARCH_IXP4XX [=y] && OF [=n]
     Selected by [y]:
     - ARCH_IXP4XX [=y] && <choice>

This is because it is possible to select ARCH_IXP4XX witout
OF while that selects the GPIO driver that now depends on
OF.

Fix this by creating a single ARCH_IXP4XX kconfig that selects
USE_OF.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Krzysztof Halasa <khalasa@piap.pl>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for fixes for
v5.19.
---
 arch/arm/mach-ixp4xx/Kconfig | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index dc6ea3c2e3ed..cb46802f5ce5 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -3,28 +3,17 @@ menuconfig ARCH_IXP4XX
 	bool "IXP4xx-based platforms"
 	depends on ARCH_MULTI_V5
 	depends on CPU_BIG_ENDIAN
+	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
 	select CPU_XSCALE
 	select GPIO_IXP4XX
 	select GPIOLIB
 	select FORCE_PCI
+	select I2C
+	select I2C_IOP3XX
 	select IXP4XX_IRQ
 	select IXP4XX_TIMER
 	select USB_EHCI_BIG_ENDIAN_DESC
 	select USB_EHCI_BIG_ENDIAN_MMIO
-	help
-	  Support for Intel's IXP4XX (XScale) family of processors.
-
-if ARCH_IXP4XX
-
-config MACH_IXP4XX_OF
-	bool
-	prompt "Device Tree IXP4xx boards"
-	default y
-	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
-	select I2C
-	select I2C_IOP3XX
 	select USE_OF
 	help
-	  Say 'Y' here to support Device Tree-based IXP4xx platforms.
-
-endif
+	  Support for Intel's IXP4XX (XScale) family of processors.
-- 
2.35.3

