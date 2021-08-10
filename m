Return-Path: <SRS0=SoTB=NB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463C8C4320E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 14:19:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E7C960F02
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 14:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E7C960F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8BiCkvDxdfVwPB7E55z+SvybIMZD5RAlkDhPJBTX+k=; b=eAuI3COfcwHgQ3
	94YiKHG14j4y+4C0qz7nWjqRqtl/k7bM1BKbO1zzG2Vq0/4v2YTkV/GswQ5llrmDVmIQzt8/QB5CG
	xXYM87/XxR4lfL+3Jy+8xRfjrSXPQCO/MAj6vLob6dSV8ahpHYAHWZ9ErcOoZudAhKNWj/yNHCi9x
	2+H9LzHZHH0sGvIQA7I2FYFLG/fgSSgj2XqZODfwzjWuAsFKjFuKzbgytjIoqunvrMT1HyecnNLi+
	YaVePYvyYtqoDy0+Pb6TWeOULr/9rrcg9jo6f2hK5bNghpqGI4KzlmEnTlk2anjmepGLGjf8gkF0J
	VEnXxgq/A6c/jsLb/eRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDSZU-0047VE-8Y; Tue, 10 Aug 2021 14:17:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDSYF-0046px-K5
 for linux-arm-kernel@lists.infradead.org; Tue, 10 Aug 2021 14:16:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 815F4610CF;
 Tue, 10 Aug 2021 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628604979;
 bh=qNYRsj9g3X2YKXJVtom5LfSd2hBob2ktPurlVxyZx90=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=TttEPsqtTWEJcIeDGSoXz7r02H4trVvnnuDpX+w1uhvGktfQbl2eoD0HID1ejxzD/
 nslPPj7WsleidGtrgA4oyBmqU3O7pMBrGX5q5dr145hhkM3pyfMpOEYvyy+qgsDj9X
 jPgsbZnZc093KRYC5B0YFCDeLdirldeVJCtvuOHnHkkFzlB4TAsgqGNlTMIyCtx6KG
 aaSRFoiTYzA+1aHQR9al/yFkpguW4B7j0XVVaZ9uwz6mHXdJVO+ThfdXAVYM2Tbw0B
 ZgtSCuWsAiOSsaF9+jeiA8Kxxs6UiPV59UnUTFW7T9b02PoRpA3dEUH6xzX66ia8kf
 rBDn/ulWrla3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 soc@kernel.org, Sasha Levin <sashal@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 10/13] ARM: ixp4xx: goramo_mlr depends on old PCI
 driver
Date: Tue, 10 Aug 2021 10:16:02 -0400
Message-ID: <20210810141606.3117932-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810141606.3117932-1-sashal@kernel.org>
References: <20210810141606.3117932-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_071619_710535_BD3D074E 
X-CRM114-Status: GOOD (  11.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210810141602.Ksk_AVOPVtpa3MvisJrmiBZCHlbOQZytgDMsY8gLsUg@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
