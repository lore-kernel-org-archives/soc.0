Return-Path: <SRS0=x48B=MN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139F8C12002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jul 2021 15:40:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC14B61003
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jul 2021 15:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC14B61003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LJ0w6EhOMonck6XDVfXxQPgu67NcOfRBwoDASTjrVKU=; b=MVxlYIU2ojAeZr
	yjNo5m25B4rjlsOrpIdhj5qZRnDycg/MFGH6+S3kZvtir8U8u8Sbq9XLvrvulf7GzAgGD0GpiAKU+
	WD7C/es5VzT7yj2WjmxHCGl8k6NrNuDbSs/gkRX3S8wElbcyZX31F6xf2wQ+NWHPeguuP8+1krnCl
	S2uMUzqUVxxYEMRp95QV1E1zWyrT9AoJ8yZWrz8GdcTGIk3+BKwZprXkhbcf9BMK/8MXB6LDpcupN
	SZOPw2f751zEX8gthgqXv2aFyh+6NBfiSqreAt+7ZdFz9SMp/dsc7gceLzgYGC0uxpnGeqAGW0Q18
	ve9awHM9v/JwMQU+0Ceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6EIc-00GMcg-0E; Wed, 21 Jul 2021 15:38:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6DxQ-00GF5j-JV
 for linux-arm-kernel@lists.infradead.org; Wed, 21 Jul 2021 15:16:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C88261221;
 Wed, 21 Jul 2021 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626880584;
 bh=Fsb/lO6EIVRYku98DmBHA+9V7KQlDJSWmeWTp5o1OA8=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=B/XD7tgdnKEjKkJIhCNAOpgpA6u5CpE8s2vLImGVgzJanA7NvBxKzAAxYsTbcQ44Y
 W2md8saNb/+FjTB+EEfowd/uW2ebgwf4/4OrW7QflUiSAh9A+VCHA3aTEBxxXlM1NH
 ddHKkvhuzWijKlwNnACworQ5vmAtWW3s5oSqqWSVFHytefForg0+vyDapW4a0tAct9
 L3nyysXOCFHQIETgGUcpn+FnHNZ7hrpzTvjCx1j8w+pIiLTgQJ2N93RtbKivslEARJ
 tIrfkw55sQjQCYYqFdPr509dK79nGl6Wl17a2bUHdQH24lJHZUjATQj4xxWfUax2fp
 tRCcVDspE9+uw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Imre Kaloz <kaloz@openwrt.org>,
 Krzysztof Halasa <khalasa@piap.pl>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: ixp4xx: goramo_mlr depends on old PCI driver
Date: Wed, 21 Jul 2021 17:16:04 +0200
Message-ID: <20210721151620.2373500-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_081624_721299_477D4109 
X-CRM114-Status: GOOD (  11.33  )
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
Message-ID: <20210721151604.jJ03pKIP1C1eht5wkyv1OJ3ID_Z5jkKS87Ob-vH-epk@z>

From: Arnd Bergmann <arnd@arndb.de>

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

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: soc@kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-ixp4xx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index bf14d65120b9..34a1c7742088 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -91,6 +91,7 @@ config MACH_IXDP465
 
 config MACH_GORAMO_MLR
 	bool "GORAMO Multi Link Router"
+	depends on IXP4XX_PCI_LEGACY
 	help
 	  Say 'Y' here if you want your kernel to support GORAMO
 	  MultiLink router.
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
