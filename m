Return-Path: <SRS0=dEhN=3V=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D42C433FE
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 22:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CEE2C433B5; Mon, 21 Nov 2022 22:10:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E649DC433D7
	for <soc@kernel.org>; Mon, 21 Nov 2022 22:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E649DC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id be13so20896926lfb.4
        for <soc@kernel.org>; Mon, 21 Nov 2022 14:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NQ+sb5fWx0zzY9D9Hzfb1VS3vUwNtOhdp/GACOFf14=;
        b=XOKKpSB2oWBgU5nJzRr3R4Q1cbpFH+AxjSb0Y1dgvH/xTVjGhF16g+a6t5F0nRkdeE
         4anceXB+SDSbPN+LCQwL9qcZkPXSZVE78tDYfEKx0yb3DPra0tPMoC9GVscVPQ/1kF/1
         XBZiVERUlBJYDYZ/KOrsJ4aOvCFchUMVJkUtkYT8O5+hdqFMX5Fq0BV0G9YyHL/8TFM0
         vvpQfnWKrOj5Z56nVOgiFN9XY8B55NCjb15enAXg7wvItn8ZOzpSspGpf3RM2KmBTomK
         0QIGTRf3+XqY6XjE4/R2FuTyH2DRJNud1oAcwPKLce1xmSVTnn2yFXSoBGD3/RZ4rCx/
         SiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NQ+sb5fWx0zzY9D9Hzfb1VS3vUwNtOhdp/GACOFf14=;
        b=ldLy3npQyn9IHFhxuV/PucVqp64vAAsDeVDyU3lrR5rRHNV0sDwttSOHLwrjcEG4Gs
         Wi0tW/z8z/nM3SuaPyxU+3OgWa1sY0t3p4m9PzbKHfXBGtKatNZRZjNDu5pUFXBRFxZz
         +z46GOEz9yp0PpdxZQWbVV/LYK+4j9dn1m+kOt4/ann4GxqWEBKomRwDY/71LT/BQBDC
         jxwzDhr96AhG25rfzrvnc00w4rOEg8lwQgjabBI8sM5q14jXQtVLBqMr8bEiiyzFbpu6
         FA2nS6knd8gcd3rmsv+2bd+WLzfG/iAwKJQlXAR8rCpoHXLg8jUP/DQmmPTi3J95id/z
         V5Mw==
X-Gm-Message-State: ANoB5pl5s5o2gSjX6Pm3MJgSihEiditJQH06CzYebbgaogElwTqSOQbv
	aAORlkw3IlnIwntoEJW4ecOzdSfL/Z4OPg==
X-Google-Smtp-Source: AA0mqf6g9VKovCVc0RUDf86dEVYfrmuBDHf99iegzXtdbj7o6yvAIkUazwm9egONR7e6jqMoVMaw6A==
X-Received: by 2002:a05:6512:238d:b0:4ad:5f5c:2b31 with SMTP id c13-20020a056512238d00b004ad5f5c2b31mr6336723lfv.422.1669068617678;
        Mon, 21 Nov 2022 14:10:17 -0800 (PST)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id 12-20020ac25f0c000000b004948ddb4e4dsm2181079lfq.301.2022.11.21.14.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 14:10:17 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: ixp4xx: Remove unused debug iomap
Date: Mon, 21 Nov 2022 23:10:15 +0100
Message-Id: <20221121221015.1454948-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we don't provide the .map_io() callback, the LL debug
defines will kick in anyway, so delete the UART debug map
as well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this as a fixup on top
of the pulled IXP4xx patches if it looks OK.
---
 arch/arm/mach-ixp4xx/ixp4xx-of.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/ixp4xx-of.c b/arch/arm/mach-ixp4xx/ixp4xx-of.c
index 9f1557f33e84..1b4d84a5b02f 100644
--- a/arch/arm/mach-ixp4xx/ixp4xx-of.c
+++ b/arch/arm/mach-ixp4xx/ixp4xx-of.c
@@ -2,31 +2,7 @@
 /*
  * IXP4xx Device Tree boot support
  */
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/io.h>
-
 #include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-
-#ifdef CONFIG_DEBUG_UART_8250
-static struct map_desc ixp4xx_of_io_desc[] __initdata = {
-	/* This is needed for LL-debug/earlyprintk/debug-macro.S */
-	{
-		.virtual = CONFIG_DEBUG_UART_VIRT,
-		.pfn = __phys_to_pfn(CONFIG_DEBUG_UART_PHYS),
-		.length = SZ_4K,
-		.type = MT_DEVICE,
-	},
-};
-
-static void __init ixp4xx_of_map_io(void)
-{
-	iotable_init(ixp4xx_of_io_desc, ARRAY_SIZE(ixp4xx_of_io_desc));
-}
-#else
-#define ixp4xx_of_map_io NULL
-#endif
 
 /*
  * We handle 4 different SoC families. These compatible strings are enough
@@ -42,6 +18,5 @@ static const char *ixp4xx_of_board_compat[] = {
 };
 
 DT_MACHINE_START(IXP4XX_DT, "IXP4xx (Device Tree)")
-	.map_io		= ixp4xx_of_map_io,
 	.dt_compat	= ixp4xx_of_board_compat,
 MACHINE_END
-- 
2.38.1

