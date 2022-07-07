Return-Path: <SRS0=My2w=XM=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36631CCA479
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 14:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F1E6C341CE; Thu,  7 Jul 2022 14:21:18 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A58B0C3411E;
	Thu,  7 Jul 2022 14:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A58B0C3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657203677; x=1688739677;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DCbTRZ++Y/Yub3ddPboAcWilvsoYNUAQmzlXvdxWcqw=;
  b=Yo4BqNE9hQr6MK/EAkb9rebAhDVMZMmIHcwIplTsHzWmbxXwm/P3ud8L
   UG4tMsRTF66+2gGEii2wQpWW8mC3XlOKUnlsd6F7ftKhho596MGNSU6uD
   Vp94rnEmup1BBIheyP3DHLB53ox40JTqfd2LnLXTCn4mh3lgzYCc5EFEk
   /eXcq2xmWZwwyFsZxmbpnzgZxLRQrzINxLqhutVFu2wKBLMg46UtFbfzW
   hhrQRAaYpMR96IKU9IrB5gC27LgHYTegNdlU9GE4Xej4JBsa6bgaEv90e
   jOWyITmnCPAUtdSISNtneTgNj1Vj2H5jCWgP8t8TJVuegim9cCKdIe++A
   A==;
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="163767505"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jul 2022 07:21:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Jul 2022 07:21:08 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 7 Jul 2022 07:21:05 -0700
From: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>
CC: <conor.dooley@microchip.com>, <Cyril.Jean@microchip.com>,
	<Daire.McNamara@microchip.com>, <Lewis.Hanly@microchip.com>,
	<aou@eecs.berkeley.edu>, <arnd@arndb.de>, <bhelgaas@google.com>,
	<herbert@gondor.apana.org.au>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <lorenzo.pieralisi@arm.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <palmer@dabbelt.com>,
	<palmer@rivosinc.com>, <paul.walmsley@sifive.com>
Subject: [RESEND#2 PATCH v4] MAINTAINERS: add polarfire rng, pci and clock drivers
Date: Thu, 7 Jul 2022 15:20:42 +0100
Message-ID: <20220707142041.4096246-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hardware random, PCI and clock drivers for the PolarFire SoC have been
upstreamed but are not covered by the MAINTAINERS entry, so add them.
Daire is the author of the clock & PCI drivers, so add him as a
maintainer in place of Lewis.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Resending with +CC soc@kernel.org
It's a v4 because the other patches were applied/dropped.

 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a6d3bd9d2a8d..01a7bfa49bdc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17136,12 +17136,15 @@ N:	riscv
 K:	riscv
 
 RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
-M:	Lewis Hanly <lewis.hanly@microchip.com>
 M:	Conor Dooley <conor.dooley@microchip.com>
+M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
+F:	drivers/char/hw_random/mpfs-rng.c
+F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.36.1

