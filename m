Return-Path: <SRS0=8Jpy=CQ=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89680EB64D7
	for <soc@archiver.kernel.org>; Wed, 28 Jun 2023 07:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 584F6C433C9; Wed, 28 Jun 2023 07:13:56 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 385F2C433C0;
	Wed, 28 Jun 2023 07:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 385F2C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687936434; x=1719472434;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iBi0RwTc2avL6Nnxdn64K9mSHsLrRGl/QBwCBLoaXC0=;
  b=P2+A0Y64k3LFrEWjh6adcJqMXVRB0AiI9HsGDIhiYQnvysYCteNwSpj6
   XgFYzgjdsYeNPaNjFDZ8cEkVXMYIwM2mrmFmP90QpZhiYeJ5jO+l3tZNZ
   3sfSBpp09nFGoO/uOnACUK4ZFll9Ul0fQDg9B91DpB8fx5ObgVp3FOJkR
   sjEqwDQuQGIjx+OG0xYs6K48SUYdCDf3Jbu4Pk0P3TYNziiAmCimHVEqh
   JIklljPGiFU+Fj1Wmqwr61T37D0Y4ETaSOm9ag1hqfk9I+FqAgUMtMmX/
   bPrpxMtFNftWAtHz6jr+siv1eZ7/+vkOCLT1QTHuRMq2pQ5Nqep7EDnpl
   A==;
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="232608868"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jun 2023 00:13:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 28 Jun 2023 00:13:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 28 Jun 2023 00:13:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [GIT PULL] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
Date: Wed, 28 Jun 2023 08:12:30 +0100
Message-ID: <20230628-left-attractor-94b7bd5fbb83@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1545; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iBi0RwTc2avL6Nnxdn64K9mSHsLrRGl/QBwCBLoaXC0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmz70aZCVYq8r5d8DC1UObwB58nbjs8Gwzs73Id/Hn606n/ nNuvdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiRSqMDOfONT0+o7T2eqnfT4PDE+ uWOqdkfQ57pPxzhbRbzY9D4aKMDNschDLcGjSPaz/ZYDc59svLSRF9doxJ+wquCJ7RFy6czwkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Randy reported build errors in linux-next where XIP_KERNEL was enabled.
ARCH_THEAD requires alternatives to support the non-standard ISA
extensions used by the THEAD cores, which are mutually exclusive with
XIP kernels. Clone the dependency list from the Allwinner entry, since
Allwinner's D1 uses T-Head cores with the same non-standard extensions.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Link: https://lore.kernel.org/all/ab38f6af-cb68-a918-1a63-2e7c927a8ffc@infradead.org/
Fixes: da47ce003963 ("riscv: Add the T-HEAD SoC family Kconfig option")
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
A fix for a randconfig issue Randy spotted in linux-next at the weekend.
This fix has been in linux-next since Monday. Noticed your PRs hadn't
gone out, so figured I should send this, rather than let the issue sneak
into mainline.
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index ce10a38dff37..6833d01e2e70 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -43,6 +43,7 @@ config ARCH_SUNXI
 
 config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
+	depends on MMU && !XIP_KERNEL
 	select ERRATA_THEAD
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
-- 
2.40.1

