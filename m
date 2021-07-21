Return-Path: <SRS0=x48B=MN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB49AC636C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jul 2021 15:39:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FE061208
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jul 2021 15:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FE061208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zkKzH98QWQOWNJ42oK6Nw4NgwY96qgUEZnYGDsTniDo=; b=F/0JSKOqtKWCmk
	xIbr2W9+jD5AsAaa4DPZevaMXKsIrU5qYMmfMvOxbJ/zjNAOwonrWlFp3N4oBLM5tQyqAJsVluFEl
	MKL5XtKu2BIPRhoVxI9N7QtgDmla5U5Ua64TEvf5YjzUedn2w5urWiXgnheB9oks2F18Tx1zGlKOd
	3/v+37ftsiwsTrDFEWyqNx8pEfR3yNcuHnx+G6S2Nr1DODoiLwXaGJuAEkMlSdwn0FbSMTvv36yJ6
	M615o8qOVZqQLDcGa68iEcKI70OklOivmtEb2OemUkKe9Ru2gEdoCxkiHtgoo1/rDYQl2S96i/Y5d
	CALHQcKdGggVR3gGaocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6EHL-00GMAa-5L; Wed, 21 Jul 2021 15:37:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Dwt-00GEuv-Rj
 for linux-arm-kernel@lists.infradead.org; Wed, 21 Jul 2021 15:15:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8CCF606A5;
 Wed, 21 Jul 2021 15:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626880551;
 bh=mbTY3nKYblFb2CAOwYxmNGvqoy4gFfQGCb4HsO/qTo4=;
 h=From:To:List-Id:Cc:Subject:Date:From;
 b=pCjWU0+oQjkJfIx9Tv1B8JLaV9NbQrY8ZjuFbH+yUISC3DCdSanXsBOTX6RjF7Fxh
 6aqmFOpDTqBupwJBXMJDhfTAGAyy/nAjQ+bE7aTHYAcMd0rWPWGWlRw96wXINLwLEA
 AxTj2XvxMLyqvSw+zckZ7na8WG7ZMoZI4m3Re1kJnZ1PDkyNARXpt24m9cqFOpNTCE
 NYYQ4nhaFhU+0Fv1TBmRO+WKmw3LimxjtDpv/HL9V7nKvg9Is1d3cqF+Lp9H49R5yM
 Dt0i04E41CoA5Lx9KkceAagwwKrIeODzHNSVc/+BHN2t92InwIjDoc+rig8GKq6+Uo
 EHiNaVGffWMSw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: [PATCH] ARM: ixp4xx: fix building both pci drivers
Date: Wed, 21 Jul 2021 17:15:22 +0200
Message-ID: <20210721151546.2325937-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_081552_012191_BB553DC1 
X-CRM114-Status: GOOD (  14.90  )
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
Message-ID: <20210721151522.7V42yjC9eMHDVjoetv4mFhPqB2XJoSHyGJEGWSibgoQ@z>

From: Arnd Bergmann <arnd@arndb.de>

When both the old and the new PCI drivers are enabled
in the same kernel, there are a couple of namespace
conflicts that cause a build failure:

drivers/pci/controller/pci-ixp4xx.c:38: error: "IXP4XX_PCI_CSR" redefined [-Werror]
   38 | #define IXP4XX_PCI_CSR                  0x1c
      |
In file included from arch/arm/mach-ixp4xx/include/mach/hardware.h:23,
                 from arch/arm/mach-ixp4xx/include/mach/io.h:15,
                 from arch/arm/include/asm/io.h:198,
                 from include/linux/io.h:13,
                 from drivers/pci/controller/pci-ixp4xx.c:20:
arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h:221: note: this is the location of the previous definition
  221 | #define IXP4XX_PCI_CSR(x) ((volatile u32 *)(IXP4XX_PCI_CFG_BASE_VIRT+(x)))
      |
drivers/pci/controller/pci-ixp4xx.c:148:12: error: 'ixp4xx_pci_read' redeclared as different kind of symbol
  148 | static int ixp4xx_pci_read(struct ixp4xx_pci *p, u32 addr, u32 cmd, u32 *data)
      |            ^~~~~~~~~~~~~~~

Rename both the ixp4xx_pci_read/ixp4xx_pci_write functions and the
IXP4XX_PCI_CSR macro. In each case, I went with the version that
has fewer callers to keep the change small.

Fixes: f7821b493458 ("PCI: ixp4xx: Add a new driver for IXP4xx")
Cc: soc@kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../mach-ixp4xx/include/mach/ixp4xx-regs.h    | 48 +++++++++----------
 drivers/pci/controller/pci-ixp4xx.c           |  8 ++--
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h b/arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h
index abb07f105515..74e63d4531aa 100644
--- a/arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h
+++ b/arch/arm/mach-ixp4xx/include/mach/ixp4xx-regs.h
@@ -218,30 +218,30 @@
 /*
  * PCI Control/Status Registers
  */
-#define IXP4XX_PCI_CSR(x) ((volatile u32 *)(IXP4XX_PCI_CFG_BASE_VIRT+(x)))
-
-#define PCI_NP_AD               IXP4XX_PCI_CSR(PCI_NP_AD_OFFSET)
-#define PCI_NP_CBE              IXP4XX_PCI_CSR(PCI_NP_CBE_OFFSET)
-#define PCI_NP_WDATA            IXP4XX_PCI_CSR(PCI_NP_WDATA_OFFSET)
-#define PCI_NP_RDATA            IXP4XX_PCI_CSR(PCI_NP_RDATA_OFFSET)
-#define PCI_CRP_AD_CBE          IXP4XX_PCI_CSR(PCI_CRP_AD_CBE_OFFSET)
-#define PCI_CRP_WDATA           IXP4XX_PCI_CSR(PCI_CRP_WDATA_OFFSET)
-#define PCI_CRP_RDATA           IXP4XX_PCI_CSR(PCI_CRP_RDATA_OFFSET)
-#define PCI_CSR                 IXP4XX_PCI_CSR(PCI_CSR_OFFSET) 
-#define PCI_ISR                 IXP4XX_PCI_CSR(PCI_ISR_OFFSET)
-#define PCI_INTEN               IXP4XX_PCI_CSR(PCI_INTEN_OFFSET)
-#define PCI_DMACTRL             IXP4XX_PCI_CSR(PCI_DMACTRL_OFFSET)
-#define PCI_AHBMEMBASE          IXP4XX_PCI_CSR(PCI_AHBMEMBASE_OFFSET)
-#define PCI_AHBIOBASE           IXP4XX_PCI_CSR(PCI_AHBIOBASE_OFFSET)
-#define PCI_PCIMEMBASE          IXP4XX_PCI_CSR(PCI_PCIMEMBASE_OFFSET)
-#define PCI_AHBDOORBELL         IXP4XX_PCI_CSR(PCI_AHBDOORBELL_OFFSET)
-#define PCI_PCIDOORBELL         IXP4XX_PCI_CSR(PCI_PCIDOORBELL_OFFSET)
-#define PCI_ATPDMA0_AHBADDR     IXP4XX_PCI_CSR(PCI_ATPDMA0_AHBADDR_OFFSET)
-#define PCI_ATPDMA0_PCIADDR     IXP4XX_PCI_CSR(PCI_ATPDMA0_PCIADDR_OFFSET)
-#define PCI_ATPDMA0_LENADDR     IXP4XX_PCI_CSR(PCI_ATPDMA0_LENADDR_OFFSET)
-#define PCI_ATPDMA1_AHBADDR     IXP4XX_PCI_CSR(PCI_ATPDMA1_AHBADDR_OFFSET)
-#define PCI_ATPDMA1_PCIADDR     IXP4XX_PCI_CSR(PCI_ATPDMA1_PCIADDR_OFFSET)
-#define PCI_ATPDMA1_LENADDR     IXP4XX_PCI_CSR(PCI_ATPDMA1_LENADDR_OFFSET)
+#define _IXP4XX_PCI_CSR(x) ((volatile u32 *)(IXP4XX_PCI_CFG_BASE_VIRT+(x)))
+
+#define PCI_NP_AD               _IXP4XX_PCI_CSR(PCI_NP_AD_OFFSET)
+#define PCI_NP_CBE              _IXP4XX_PCI_CSR(PCI_NP_CBE_OFFSET)
+#define PCI_NP_WDATA            _IXP4XX_PCI_CSR(PCI_NP_WDATA_OFFSET)
+#define PCI_NP_RDATA            _IXP4XX_PCI_CSR(PCI_NP_RDATA_OFFSET)
+#define PCI_CRP_AD_CBE          _IXP4XX_PCI_CSR(PCI_CRP_AD_CBE_OFFSET)
+#define PCI_CRP_WDATA           _IXP4XX_PCI_CSR(PCI_CRP_WDATA_OFFSET)
+#define PCI_CRP_RDATA           _IXP4XX_PCI_CSR(PCI_CRP_RDATA_OFFSET)
+#define PCI_CSR                 _IXP4XX_PCI_CSR(PCI_CSR_OFFSET) 
+#define PCI_ISR                 _IXP4XX_PCI_CSR(PCI_ISR_OFFSET)
+#define PCI_INTEN               _IXP4XX_PCI_CSR(PCI_INTEN_OFFSET)
+#define PCI_DMACTRL             _IXP4XX_PCI_CSR(PCI_DMACTRL_OFFSET)
+#define PCI_AHBMEMBASE          _IXP4XX_PCI_CSR(PCI_AHBMEMBASE_OFFSET)
+#define PCI_AHBIOBASE           _IXP4XX_PCI_CSR(PCI_AHBIOBASE_OFFSET)
+#define PCI_PCIMEMBASE          _IXP4XX_PCI_CSR(PCI_PCIMEMBASE_OFFSET)
+#define PCI_AHBDOORBELL         _IXP4XX_PCI_CSR(PCI_AHBDOORBELL_OFFSET)
+#define PCI_PCIDOORBELL         _IXP4XX_PCI_CSR(PCI_PCIDOORBELL_OFFSET)
+#define PCI_ATPDMA0_AHBADDR     _IXP4XX_PCI_CSR(PCI_ATPDMA0_AHBADDR_OFFSET)
+#define PCI_ATPDMA0_PCIADDR     _IXP4XX_PCI_CSR(PCI_ATPDMA0_PCIADDR_OFFSET)
+#define PCI_ATPDMA0_LENADDR     _IXP4XX_PCI_CSR(PCI_ATPDMA0_LENADDR_OFFSET)
+#define PCI_ATPDMA1_AHBADDR     _IXP4XX_PCI_CSR(PCI_ATPDMA1_AHBADDR_OFFSET)
+#define PCI_ATPDMA1_PCIADDR     _IXP4XX_PCI_CSR(PCI_ATPDMA1_PCIADDR_OFFSET)
+#define PCI_ATPDMA1_LENADDR     _IXP4XX_PCI_CSR(PCI_ATPDMA1_LENADDR_OFFSET)
 
 /*
  * PCI register values and bit definitions 
diff --git a/drivers/pci/controller/pci-ixp4xx.c b/drivers/pci/controller/pci-ixp4xx.c
index 896a45b24236..654ac4a82beb 100644
--- a/drivers/pci/controller/pci-ixp4xx.c
+++ b/drivers/pci/controller/pci-ixp4xx.c
@@ -145,7 +145,7 @@ static int ixp4xx_pci_check_master_abort(struct ixp4xx_pci *p)
 	return 0;
 }
 
-static int ixp4xx_pci_read(struct ixp4xx_pci *p, u32 addr, u32 cmd, u32 *data)
+static int ixp4xx_pci_read_indirect(struct ixp4xx_pci *p, u32 addr, u32 cmd, u32 *data)
 {
 	ixp4xx_writel(p, IXP4XX_PCI_NP_AD, addr);
 
@@ -170,7 +170,7 @@ static int ixp4xx_pci_read(struct ixp4xx_pci *p, u32 addr, u32 cmd, u32 *data)
 	return ixp4xx_pci_check_master_abort(p);
 }
 
-static int ixp4xx_pci_write(struct ixp4xx_pci *p, u32 addr, u32 cmd, u32 data)
+static int ixp4xx_pci_write_indirect(struct ixp4xx_pci *p, u32 addr, u32 cmd, u32 data)
 {
 	ixp4xx_writel(p, IXP4XX_PCI_NP_AD, addr);
 
@@ -308,7 +308,7 @@ static int ixp4xx_pci_read_config(struct pci_bus *bus, unsigned int devfn,
 	dev_dbg(p->dev, "read_config from %d size %d dev %d:%d:%d address: %08x cmd: %08x\n",
 		where, size, bus_num, PCI_SLOT(devfn), PCI_FUNC(devfn), addr, cmd);
 
-	ret = ixp4xx_pci_read(p, addr, cmd, &val);
+	ret = ixp4xx_pci_read_indirect(p, addr, cmd, &val);
 	if (ret)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
@@ -356,7 +356,7 @@ static int ixp4xx_pci_write_config(struct pci_bus *bus,  unsigned int devfn,
 	dev_dbg(p->dev, "write_config_byte %#x to %d size %d dev %d:%d:%d addr: %08x cmd %08x\n",
 		value, where, size, bus_num, PCI_SLOT(devfn), PCI_FUNC(devfn), addr, cmd);
 
-	ret = ixp4xx_pci_write(p, addr, cmd, val);
+	ret = ixp4xx_pci_write_indirect(p, addr, cmd, val);
 	if (ret)
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
