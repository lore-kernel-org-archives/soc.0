Return-Path: <SRS0=SoTB=NB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284A4C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 14:22:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0BB660F02
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 14:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0BB660F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCsZvwyqMc4bpKAYZLxs0wCMFzlwtlD1qym5SnVvU8k=; b=DosNRDPIN6sMmN
	n4t4ij70alNLRKdzFfG4dxCnVMCWHTW3xrlJkhfYgMcYtJGqfSViPhaxWIQSImmqi5t4dDNdoOXJ4
	zZ9fbfYJglkuXtuVdYi0LD1BF9O+WXtuWnjq2JmCaivCJFIVcATcO2uM6anTNPMr7VcaktrX79hY7
	katetsqwPJgSLvNextDOchirlBQTjqsG13MUUvPnK0qn7Qo/4tLxhmtDIkMuoEmzT734Su+vjNI1q
	78kOOlNquja8vKi5Pyrw3b65KeUHOnRn9fQ2yRLuf3lmjO7mFAk1F33R9djrJKPrTLy4WMD/2/xCF
	Ozx285qvLozw1owIwTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDSc9-00498r-TG; Tue, 10 Aug 2021 14:20:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDSYm-004795-9g
 for linux-arm-kernel@lists.infradead.org; Tue, 10 Aug 2021 14:16:53 +0000
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
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 soc@kernel.org, Sasha Levin <sashal@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 08/10] ARM: ixp4xx: goramo_mlr depends on old PCI
 driver
Date: Tue, 10 Aug 2021 10:16:39 -0400
Message-ID: <20210810141641.3118360-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810141641.3118360-1-sashal@kernel.org>
References: <20210810141641.3118360-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_071652_360510_75E2667A 
X-CRM114-Status: GOOD (  10.88  )
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
Message-ID: <20210810141639.PiEBk9Od3QIF77G1vghramhYHu8xGni3vtn8pJyr41E@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
