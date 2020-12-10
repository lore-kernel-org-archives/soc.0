Return-Path: <matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104F7C4361B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 11:51:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BD1B423D98; Thu, 10 Dec 2020 11:51:31 +0000 (UTC)
From: matthias.bgg@kernel.org
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: enric.balletbo@collabora.com,
	kernel test robot <lkp@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mmsys: Specify HAS_IOMEM dependency for MTK_MMSYS
Date: Thu, 10 Dec 2020 12:51:24 +0100
Message-Id: <20201210115124.1285-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Because mtk-mmsys uses the 'devm_platform_ioremap_resource' function, it
should depend on HAS_IOMEM.

Fixes: cc6576029aed ("soc: mediatek: mmsys: Use devm_platform_ioremap_resource()")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Link: https://lore.kernel.org/r/20201203121447.3366406-1-enric.balletbo@collabora.com
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 drivers/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 851121d83f14..fdd8bc08569e 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -68,6 +68,7 @@ config MTK_SCPSYS_PM_DOMAINS
 config MTK_MMSYS
 	bool "MediaTek MMSYS Support"
 	default ARCH_MEDIATEK
+	depends on HAS_IOMEM
 	help
 	  Say yes here to add support for the MediaTek Multimedia
 	  Subsystem (MMSYS).
-- 
2.29.2

