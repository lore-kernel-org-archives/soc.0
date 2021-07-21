Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3089EC12002
	for <soc@archiver.kernel.org>; Wed, 21 Jul 2021 15:15:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 15D3D61246; Wed, 21 Jul 2021 15:15:51 +0000 (UTC)
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
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH] ARM: ixp4xx: fix building both pci drivers
Date: Wed, 21 Jul 2021 17:15:22 +0200
Message-Id: <20210721151546.2325937-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

