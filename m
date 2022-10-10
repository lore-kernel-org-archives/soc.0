Return-Path: <SRS0=YheT=2L=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FEAC433F5
	for <soc@archiver.kernel.org>; Mon, 10 Oct 2022 04:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42DA7C433C1; Mon, 10 Oct 2022 04:23:01 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66ADAC433B5
	for <soc@kernel.org>; Mon, 10 Oct 2022 04:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66ADAC433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id j18so1028100plj.5
        for <soc@kernel.org>; Sun, 09 Oct 2022 21:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/Vb8/Qi3Qrtb7eH308lY42+cFyKVOa2Ko/edp/2v7Y=;
        b=PJl4mFGBWUCrLZreJMEzvfznQiOC/tpsDg/+08v3ix0Ud5tt6PNBq0nBlTSiO0YJ46
         JIwhPdjl/rx0SzoBQInc1iFxLsQa3LjyqKwsKZn1AX/cpigZt2o9wiTiP2aAMoMM17Qu
         k1l51KLHhqi23QtBMEnCupiffWk+ZNsy6EOuvND53Q8oA8sUJOqOdZAcCv06dbPu2IAR
         ONFOJuKdmhrqwzYQzWknXB6cbjTGZ5as5vAkQTj8M8Ap6Uxi6H49ISUR2JHKPWGCYU99
         mFAtScgGKoHmfqlTB4X6ts6LdKWTY1U8xDw5zwXR83OBRUnF0T4lTd5VhUgjnVe4YrLw
         Hu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/Vb8/Qi3Qrtb7eH308lY42+cFyKVOa2Ko/edp/2v7Y=;
        b=cmg0eWlNuxGI80IO2X92G9bI8TiWb2MR5q1ZFaebfI+v2Ri7NiSa0g/xN1WC+Q7cXx
         CqPQeJEyOkWBRXjvvgQm7Yv2mvsOvXbNhtO2uNqnRWjzCePqCNqrgvElTLvekCIvb41j
         IiV5p00v/jS3GampPJD4H8CpKfYEQPdbnOkzaXtc7XLG7HnY6gDDJeBXJhRRYF9mwGT1
         TlL/HrYuNFMp8+vRZwURLvWyjPgL9JDVUPqGsEPL37VMVyDMAkb4kjJkkzNuHTJtUd8W
         nosGNL+Hygst69D3l9LqfIoQ6Q8U3Ni6ejHFEoJG96Q+UszAcQ4caLd6L+o/Wwb9XPJu
         Ptcw==
X-Gm-Message-State: ACrzQf0/j33h8/t1wVwILsXdGLhNDyyvkNasuzmNsW903O8YCo+2rRex
	8Drlb0rXOFimB/A73RA/3V+swA==
X-Google-Smtp-Source: AMsMyM7O83K9ENPPV2OKiyYBCXVe0Mh4UCFtMVcfhPOrNfnvPDeTZxJHkz7WbVWxnaJIu64/6k8SXQ==
X-Received: by 2002:a17:90b:4f4d:b0:20d:2225:4275 with SMTP id pj13-20020a17090b4f4d00b0020d22254275mr9141922pjb.191.1665375778778;
        Sun, 09 Oct 2022 21:22:58 -0700 (PDT)
Received: from localhost ([122.172.86.128])
        by smtp.gmail.com with ESMTPSA id c8-20020a17090a020800b0020a1f091a0asm7019607pjc.55.2022.10.09.21.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 21:22:58 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	kernel test robot <lkp@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: spear: Move prototype to accessible header
Date: Mon, 10 Oct 2022 09:52:37 +0530
Message-Id: <f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/clk/spear/spear6xx_clock.c:116:13: warning: no previous prototype for function 'spear6xx_clk_init' [-Wmissing-prototypes]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/mach-spear/generic.h      |  3 ---
 arch/arm/mach-spear/spear3xx.c     |  1 +
 arch/arm/mach-spear/spear6xx.c     |  1 +
 drivers/clk/spear/spear3xx_clock.c |  1 +
 drivers/clk/spear/spear6xx_clock.c |  1 +
 include/linux/clk/spear.h          | 14 ++++++++++++++
 6 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-spear/generic.h b/arch/arm/mach-spear/generic.h
index 43b7996ab754..9e36920d4cfd 100644
--- a/arch/arm/mach-spear/generic.h
+++ b/arch/arm/mach-spear/generic.h
@@ -25,11 +25,8 @@ extern struct pl022_ssp_controller pl022_plat_data;
 extern struct pl08x_platform_data pl080_plat_data;
 
 void __init spear_setup_of_timer(void);
-void __init spear3xx_clk_init(void __iomem *misc_base,
-			      void __iomem *soc_config_base);
 void __init spear3xx_map_io(void);
 void __init spear3xx_dt_init_irq(void);
-void __init spear6xx_clk_init(void __iomem *misc_base);
 void __init spear13xx_map_io(void);
 void __init spear13xx_l2x0_init(void);
 
diff --git a/arch/arm/mach-spear/spear3xx.c b/arch/arm/mach-spear/spear3xx.c
index 2ba406e92c41..7ef9670d3029 100644
--- a/arch/arm/mach-spear/spear3xx.c
+++ b/arch/arm/mach-spear/spear3xx.c
@@ -13,6 +13,7 @@
 #include <linux/amba/pl022.h>
 #include <linux/amba/pl080.h>
 #include <linux/clk.h>
+#include <linux/clk/spear.h>
 #include <linux/io.h>
 #include <asm/mach/map.h>
 #include "pl080.h"
diff --git a/arch/arm/mach-spear/spear6xx.c b/arch/arm/mach-spear/spear6xx.c
index 7a5fff134872..f0a1e704cceb 100644
--- a/arch/arm/mach-spear/spear6xx.c
+++ b/arch/arm/mach-spear/spear6xx.c
@@ -12,6 +12,7 @@
 
 #include <linux/amba/pl08x.h>
 #include <linux/clk.h>
+#include <linux/clk/spear.h>
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
diff --git a/drivers/clk/spear/spear3xx_clock.c b/drivers/clk/spear/spear3xx_clock.c
index 41717ff707f6..ba8791303156 100644
--- a/drivers/clk/spear/spear3xx_clock.c
+++ b/drivers/clk/spear/spear3xx_clock.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/clk/spear.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of_platform.h>
diff --git a/drivers/clk/spear/spear6xx_clock.c b/drivers/clk/spear/spear6xx_clock.c
index 490701ac9e93..c192a9141b86 100644
--- a/drivers/clk/spear/spear6xx_clock.c
+++ b/drivers/clk/spear/spear6xx_clock.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clkdev.h>
+#include <linux/clk/spear.h>
 #include <linux/io.h>
 #include <linux/spinlock_types.h>
 #include "clk.h"
diff --git a/include/linux/clk/spear.h b/include/linux/clk/spear.h
index a64d034ceddd..eaf95ca656f8 100644
--- a/include/linux/clk/spear.h
+++ b/include/linux/clk/spear.h
@@ -8,6 +8,20 @@
 #ifndef __LINUX_CLK_SPEAR_H
 #define __LINUX_CLK_SPEAR_H
 
+#ifdef CONFIG_ARCH_SPEAR3XX
+void __init spear3xx_clk_init(void __iomem *misc_base,
+			      void __iomem *soc_config_base);
+#else
+static inline void __init spear3xx_clk_init(void __iomem *misc_base,
+					    void __iomem *soc_config_base) {}
+#endif
+
+#ifdef CONFIG_ARCH_SPEAR6XX
+void __init spear6xx_clk_init(void __iomem *misc_base);
+#else
+static inline void __init spear6xx_clk_init(void __iomem *misc_base) {}
+#endif
+
 #ifdef CONFIG_MACH_SPEAR1310
 void __init spear1310_clk_init(void __iomem *misc_base, void __iomem *ras_base);
 #else
-- 
2.31.1.272.g89b43f80a514

