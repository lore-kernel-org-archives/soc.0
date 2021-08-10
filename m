Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3376FC432BE
	for <soc@archiver.kernel.org>; Tue, 10 Aug 2021 14:16:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15E996112E; Tue, 10 Aug 2021 14:16:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34D39610E9;
	Tue, 10 Aug 2021 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628605012;
	bh=ceP+nQXc8e3q3MzfM/Je2UvzGY3M7qXoUsuOeb6Z5nY=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=FvY9Gx2FkfvWuxbNJvuqx5WIE5mPZECYFKAc66vSRQBF+Vd0EznjwuolDTB9PNxqZ
	 ljcXEr6F9qKyU2M2RwqeGqEbTe9QdQWeHhOFEufxbL5QQ5TqtU86VFUp73183lRqax
	 PJe9D2pQgUl7LgRIIjs9W7LUpzrD6Yp5khI3G0dRStU5qouQWBhgvh1R8lL1kUj9pw
	 bSRiFwctaA9vxJWKQBoYVi9tFpgaAHhucqsXM8W9yo/DquwOgxk6YS4V5Lbz6Z4vsL
	 8Scd16VjdeE6WAxzA1k6NJtGFwJm03oe3HZfLOeUbWeWo7HngK5qASAD0nTrYhT/Hx
	 j94gt6Le2PnxQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 08/10] ARM: ixp4xx: goramo_mlr depends on old PCI driver
Date: Tue, 10 Aug 2021 10:16:39 -0400
Message-Id: <20210810141641.3118360-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810141641.3118360-1-sashal@kernel.org>
References: <20210810141641.3118360-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 796a8c85b1216618258e08b463d3bef0d7123760 ]

When this driver is disabled, the board file fails to build,
so add a dependency:

arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_preinit':
arch/arm/mach-ixp4xx/goramo_mlr.c:472:9: error: implicit declaration of function 'ixp4xx_pci_preinit'; did you mean 'iop3xx_pci_preinit'? [-Werror=implicit-function-declaration]
  472 |         ixp4xx_pci_preinit();
      |         ^~~~~~~~~~~~~~~~~~
      |         iop3xx_pci_preinit
arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_pci_postinit':
arch/arm/mach-ixp4xx/goramo_mlr.c:481:22: error: implicit declaration of function 'ixp4xx_pci_read' [-Werror=implicit-function-declaration]
  481 |                 if (!ixp4xx_pci_read(addr, NP_CMD_CONFIGREAD, &value)) {
      |                      ^~~~~~~~~~~~~~~
arch/arm/mach-ixp4xx/goramo_mlr.c:231:35: error: 'IXP4XX_UART1_BASE_PHYS' undeclared here (not in a function)
  231 |                 .start          = IXP4XX_UART1_BASE_PHYS,
      |                                   ^~~~~~~~~~~~~~~~~~~~~~
arch/arm/mach-ixp4xx/goramo_mlr.c: In function 'gmlr_init':
arch/arm/mach-ixp4xx/goramo_mlr.c:376:9: error: implicit declaration of function 'ixp4xx_sys_init' [-Werror=implicit-function-declaration]
  376 |         ixp4xx_sys_init();
      |         ^~~~~~~~~~~~~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: soc@kernel.org
Link: https://lore.kernel.org/r/20210721151620.2373500-1-arnd@kernel.org'
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-ixp4xx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index c342dc4e8a45..2489b6151ace 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -76,6 +76,7 @@ config MACH_IXDP465
 
 config MACH_GORAMO_MLR
 	bool "GORAMO Multi Link Router"
+	depends on IXP4XX_PCI_LEGACY
 	help
 	  Say 'Y' here if you want your kernel to support GORAMO
 	  MultiLink router.
-- 
2.30.2

