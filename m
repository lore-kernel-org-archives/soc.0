Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF76EC433C1
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 13:08:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 97F27619A9; Tue, 23 Mar 2021 13:08:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 072B161920;
	Tue, 23 Mar 2021 13:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616504933;
	bh=2SHpTb9MZLORqmsnpw6kKb4YNiJ7pwIKK6mVvZCPNvM=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=IxYt/AGWkifkWaB5s/974XknZA8fcPdnzDtxUfqJCb6inlQRZ0eSDi7zJ0VY4NwWs
	 7owBKwlWXFe5IfGX2YQri8m2F8Yye3Sl2QgWiV4lxq1ayZbN8X5MPhvjbqfs1/jvZn
	 O9089PSmgkQKy7IqKOwSfCcRrwoqLLcXHIBUCiZCQWGikeBjOv3/zS+DGs9HFAE3gh
	 y4AMprU5lWQnSuMNFaN8Ey2YYDaEWyKbEUBhij6Fx0c3Kic1LYeFFBKlpOC+oxcah6
	 ZlJH5DRUHVrnc0rYj36nhFlBwepzdTohB9aDiW9IIWM9rGh6TUGbJFWWDPhjLaE8b4
	 XPkLt1xnfCmfg==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: pxa: mainstone: avoid -Woverride-init warning
Date: Tue, 23 Mar 2021 14:08:27 +0100
Message-Id: <20210323130849.2362001-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The default initializer at the start of the array causes a warning
when building with W=1:

In file included from arch/arm/mach-pxa/mainstone.c:47:
arch/arm/mach-pxa/mainstone.h:124:33: error: initialized field overwritten [-Werror=override-init]
  124 | #define MAINSTONE_IRQ(x)        (MAINSTONE_NR_IRQS + (x))
      |                                 ^
arch/arm/mach-pxa/mainstone.h:133:33: note: in expansion of macro 'MAINSTONE_IRQ'
  133 | #define MAINSTONE_S0_CD_IRQ     MAINSTONE_IRQ(9)
      |                                 ^~~~~~~~~~~~~
arch/arm/mach-pxa/mainstone.c:506:15: note: in expansion of macro 'MAINSTONE_S0_CD_IRQ'
  506 |         [5] = MAINSTONE_S0_CD_IRQ,
      |               ^~~~~~~~~~~~~~~~~~~

Rework the initializer to list each element explicitly and only once.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index 6f4b64727df1..599736c93163 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -502,16 +502,20 @@ static inline void mainstone_init_keypad(void) {}
 #endif
 
 static int mst_pcmcia0_irqs[11] = {
-	[0 ... 10] = -1,
+	[0 ... 4] = -1,
 	[5] = MAINSTONE_S0_CD_IRQ,
+	[6 ... 7] = -1,
 	[8] = MAINSTONE_S0_STSCHG_IRQ,
+	[9] = -1,
 	[10] = MAINSTONE_S0_IRQ,
 };
 
 static int mst_pcmcia1_irqs[11] = {
-	[0 ... 10] = -1,
+	[0 ... 4] = -1,
 	[5] = MAINSTONE_S1_CD_IRQ,
+	[6 ... 7] = -1,
 	[8] = MAINSTONE_S1_STSCHG_IRQ,
+	[9] = -1,
 	[10] = MAINSTONE_S1_IRQ,
 };
 
-- 
2.29.2

