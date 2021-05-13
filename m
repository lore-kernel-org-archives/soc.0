Return-Path: <SRS0=xIwT=KI=microchip.com=Eugen.Hristev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88179C43460
	for <soc@archiver.kernel.org>; Thu, 13 May 2021 06:14:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6231C613F7; Thu, 13 May 2021 06:14:21 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC72613DE;
	Thu, 13 May 2021 06:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC72613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Eugen.Hristev@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620886462; x=1652422462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UPGXRvLS3AgmuOFiWdkF2ik+v8HO4jPIF0qnh3jhSVc=;
  b=WIJe7kcd6v8UCU/IJywSJ3QLVH66pMZqdaT7W9g65b4t3wQdYf3KJFxM
   T7j+krbD/oUhVeW2mL+apxfKACZc3KQrHMdSRzHPWiigaDlzUzPIWOK5x
   F67wwos+06sGUBjpDLq7k8Cm1AIJZkbor/zBEOVl78LVIjQz9jlRvu4k+
   1kjx2J35+x/9gnAP9jx+ovjliN10xO23iKIexR7PP470ueb6u6+TDMn1w
   FDhEriT4HHs6N8hJKEeDrO96nPAULaUTg4tKKj4KdBQb0dkyMWdA0Cdxl
   lwea9SCDuXpj/resIeumCsmDPupCPVld2O7bs9YKRE+iljXIzjlRAMkAi
   Q==;
IronPort-SDR: wr6JlxQDQfEF0+Dged10nrFeSqTEXDK0qa7XktPdqty06We0Q2nevPMJS1l3VN3CoyvWv1W26y
 AXCes59kjRckECn5P1Kv/uvQSAMekGmUCkyKOr/CsKoS4EJNWFWg6pdFJEdF3RGRiE1lP8kCX6
 ba51gZ2tpl2jPE8vm1v99So2Rp2EPJuhSMqzYSkZl2W344HfFHFtDReDP2moPt3XSxmD4oylfv
 U3mZtsRFOIFTL/Jg+6RKElZrWi4MsmAo5HtzC45LkUI2c4r5vVDt55p7luFkFLMLGmtFsHAY7+
 pog=
X-IronPort-AV: E=Sophos;i="5.82,296,1613458800"; 
   d="scan'208";a="120906635"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2021 23:14:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 23:14:20 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 12 May 2021 23:14:16 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
	<soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH v3 4/4] ARM: multi_v7_defconfig: add sama7g5 SoC
Date: Thu, 13 May 2021 09:13:54 +0300
Message-ID: <20210513061354.138158-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513061354.138158-1-eugen.hristev@microchip.com>
References: <20210513061354.138158-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add the Microchip SAMA7G5 ARM v7 Cortex-A7 based SoC to multi_v7_defconfig.
Also add it's clock timer, the PIT64B.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3823da605430..d77872e62fe7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -16,6 +16,7 @@ CONFIG_ARCH_AT91=y
 CONFIG_SOC_SAMA5D2=y
 CONFIG_SOC_SAMA5D3=y
 CONFIG_SOC_SAMA5D4=y
+CONFIG_SOC_SAMA7G5=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM_CYGNUS=y
 CONFIG_ARCH_BCM_HR2=y
@@ -996,6 +997,7 @@ CONFIG_APQ_MMCC_8084=y
 CONFIG_MSM_GCC_8660=y
 CONFIG_MSM_MMCC_8960=y
 CONFIG_MSM_MMCC_8974=y
+CONFIG_MICROCHIP_PIT64B=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_GART=y
-- 
2.25.1

