Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1C4C6377B
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 21:13:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 901FB61222; Wed, 21 Jul 2021 21:13:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 663B36120C;
	Wed, 21 Jul 2021 21:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626901992;
	bh=Ngx6+VH1fhZnpOu3mGeDj8Ixnvz9Ruplnowa5GkAXHg=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=NNyn5KHdaQEZ0Rz2vnjHEU05J4QuyI/NU6cW16zEGSm9NL/hXaJh5InVAz/mE0nih
	 eY9kYQSUndCEHdUj7zOWnhH0od1CTaA3d6tMXE9UbrL8gOpIof9ztnngCW8VVr2Fve
	 rbWiM9F9+iXi/AqStszsZm7a6zcB+u+Bdx0uOAI+C4XhQy3gJ2Lvlb9+r9pnnuQbUC
	 vI3OBc8DqiGxAyb41iCwHw0xLdWjQZ2tWIwoX9tVQS9NN/dSrB8y7YHbTbwaYxZcbi
	 zsDI/McHKsufP79/P2SZQ0H/fb0BWqWzkxfLqre0XD/vu8LqzQ3oUslwqVMOmt4uyj
	 JCMY97lu1Z54g==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: ixp4xx: fix compile-testing soc drivers
Date: Wed, 21 Jul 2021 23:12:37 +0200
Message-Id: <20210721211301.3490401-1-arnd@kernel.org>
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
 drivers/soc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.29.2

