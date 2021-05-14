Return-Path: <SRS0=B9yD=KJ=microchip.com=Eugen.Hristev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EFCC43470
	for <soc@archiver.kernel.org>; Fri, 14 May 2021 08:22:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 144E4613C4; Fri, 14 May 2021 08:22:58 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B465B61451;
	Fri, 14 May 2021 08:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B465B61451
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Eugen.Hristev@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620980577; x=1652516577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UPGXRvLS3AgmuOFiWdkF2ik+v8HO4jPIF0qnh3jhSVc=;
  b=rh2vgQYkqsIq4ePwDIEM8UkL2k62+xLaX9qKkJwAI6QYWhik+LAKbwaK
   Kc93OzJ4a5pudbGf57bcp8CmDdY0XeE1LbsM/ZpJPVRuX1qh8Lt46NQYy
   2l4m9DT7gOO/Shdrj1BaM1OFrFmE6h2HV+PYFFnfC9teUiXkhOzZAwC35
   KzxYjnrsfXchsA+pVjI+4ihjOroI/DlfXFgzhmUwTdynIF/i0G80MoyzN
   md4zHCixgEyobgTxU3INE8C9WfeTdmITsSVM9gh4OKfHxAAZYjdA8kQXj
   YvkN2CnkH0u0qFuq12WRq1YR/EqQzNQgH+CE1Abcb6DbTkMvXzLAnyAFo
   w==;
IronPort-SDR: u4UE5UOXQfY44f7yKsGNKLrT3uBCPvUWWwWuECIcY5Bc59XNVrQNbgWCbUBakI2cTtcsAHwuq9
 /P8AUCI7DSHF3Qui7hpamDiROxeQ5k6NHvrjFZiE6tH4cDG6a+7pFzTEfocww9UBneHF+Qxs5q
 wi2PggfGToNxBMUBmKEaFggPA0K+e1+aNGoGNExS+LMHsM0Bl1H3vjd7fH2LF9ULvQ+1du6fTw
 +Vn0+QFeovs+tohSGuor6JFhFarGQo0wSPTIGyyNRctSQ+aQtt0lzUT0AkKVsK7E96EEdIa6YM
 sOw=
X-IronPort-AV: E=Sophos;i="5.82,299,1613458800"; 
   d="scan'208";a="115307201"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2021 01:22:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 01:22:56 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 14 May 2021 01:22:53 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
	<soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>,
	<tudor.ambarus@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v4 4/4] ARM: multi_v7_defconfig: add sama7g5 SoC
Date: Fri, 14 May 2021 11:21:51 +0300
Message-ID: <20210514082151.178571-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514082151.178571-1-eugen.hristev@microchip.com>
References: <20210514082151.178571-1-eugen.hristev@microchip.com>
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

