Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783D8C6377A
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 21:14:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 54CF96124B; Wed, 21 Jul 2021 21:14:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A52C61222;
	Wed, 21 Jul 2021 21:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626902057;
	bh=VC+EDekdAUq8MiJsJjjbMzSqjhUGZPTowMk2NFsixRk=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=s2h/sHF1mqgyzKLUyNta15oEAoT21/Rx8TfuqFV03bs+BA/FaIDrk17bj5kYGuR04
	 +uWc3ujhQd1A9xJCE0lKmdNuWIvn/P8ZF5sGYo5udyTFt5+Zii+f7OcbkxA5HapK+0
	 4Jw2Nv20hr3lFU/lv1l7db0v/4rwRdftpWFMYNq+xCcuihuAQAHJJg2RHsKkh04raV
	 c7gdeHcG3HHsQgp90DEDqwqVSJUjlF6M25OhGMax1raSp+IsNRLQZ++efQo9lXRQva
	 EbxBWeAn7BtXzGdpBCKUP+LCWyqzzV1L65jzShu24CscgVVWDOEWGvKTaW28TFvO1o
	 z2GnclpHjXChQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] [SUBMITTED 20210721] ARM: ixp4xx: fix compile-testing soc drivers
Date: Wed, 21 Jul 2021 23:13:43 +0200
Message-Id: <20210721211412.3537004-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Randconfig builds on the ixp4xx ethernet driver showed that the qmgr and
npe drivers are not actually built even when compile testing is enabled:

ERROR: modpost: "qmgr_stat_empty" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "qmgr_enable_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "qmgr_set_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "__qmgr_request_queue" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "npe_send_recv_message" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "npe_recv_message" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "npe_load_firmware" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "npe_running" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "qmgr_disable_irq" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!
ERROR: modpost: "qmgr_stat_below_low_watermark" [drivers/net/ethernet/xscale/ixp4xx_eth.ko] undefined!

Fix it by always entering the drivers/soc/ixp4xx/ directory, and fix the
resulting compile test failures by removing the #include statements
that prevent building on most other platforms.

Fixes: 7a6c9dbb36a4 ("soc: ixp4xx: Protect IXP4xx SoC drivers by ARCH_IXP4XX || COMPILE_TEST")
Fixes: fcf2d8978cd5 ("ARM: ixp4xx: Move NPE and QMGR to drivers/soc")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/Makefile             | 2 +-
 drivers/soc/ixp4xx/ixp4xx-npe.c  | 1 -
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 8fbc718ff9db..82141f60ae19 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -13,7 +13,7 @@ obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
 obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
 obj-y				+= imx/
-obj-$(CONFIG_ARCH_IXP4XX)	+= ixp4xx/
+obj-y				+= ixp4xx/
 obj-$(CONFIG_SOC_XWAY)		+= lantiq/
 obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
 obj-y				+= mediatek/
diff --git a/drivers/soc/ixp4xx/ixp4xx-npe.c b/drivers/soc/ixp4xx/ixp4xx-npe.c
index 520d2bf7a1f1..f490c4ca51f5 100644
--- a/drivers/soc/ixp4xx/ixp4xx-npe.c
+++ b/drivers/soc/ixp4xx/ixp4xx-npe.c
@@ -21,7 +21,6 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/soc/ixp4xx/npe.h>
-#include <mach/hardware.h>
 #include <linux/soc/ixp4xx/cpu.h>
 
 #define DEBUG_MSG			0
diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 7149510b307e..c6bf6ef257c0 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -12,7 +12,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/soc/ixp4xx/qmgr.h>
-#include <mach/hardware.h>
 #include <linux/soc/ixp4xx/cpu.h>
 
 static struct qmgr_regs __iomem *qmgr_regs;
-- 
2.29.2

