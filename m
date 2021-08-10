Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD574C432BE
	for <soc@archiver.kernel.org>; Tue, 10 Aug 2021 14:15:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8EB8160FDA; Tue, 10 Aug 2021 14:15:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF4BD6024A;
	Tue, 10 Aug 2021 14:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628604958;
	bh=qNYRsj9g3X2YKXJVtom5LfSd2hBob2ktPurlVxyZx90=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=sJmjeyh31X0kxdNgwLkjBijl7m2dytLrFoDfoN08rRoO6EH99gNy+ohMkXSPWnNB7
	 QQ2iR9dRHqaTKd7oZ2tdYmxB5V+NoM43+60SyuoYzNB20kpPcd5edMcO11uN/Jexkg
	 UNOsLPohwk3PY6tBm/Xsp6s1/soTHfFx3Uey8845uBCm9PpgT6fY1LZHZBRrLv4g6H
	 ndge1tT+JLxoAE+sFNah/7y/D28MXpGaeZ87vtJBNDnNidwbK1V73qEWnGbeDjBGrD
	 /ghjC1gzkVY+2hMFosCPBOFjDwSTqmqZue5xDdiG+0iFNrOGsDB+rRGpEbv0/eOdwc
	 edPpZeVDedDzw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 15/20] ARM: ixp4xx: goramo_mlr depends on old PCI driver
Date: Tue, 10 Aug 2021 10:15:33 -0400
Message-Id: <20210810141538.3117707-15-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810141538.3117707-1-sashal@kernel.org>
References: <20210810141538.3117707-1-sashal@kernel.org>
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
index 165c184801e1..57e61e797189 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -89,6 +89,7 @@ config MACH_IXDP465
 
 config MACH_GORAMO_MLR
 	bool "GORAMO Multi Link Router"
+	depends on IXP4XX_PCI_LEGACY
 	help
 	  Say 'Y' here if you want your kernel to support GORAMO
 	  MultiLink router.
-- 
2.30.2

