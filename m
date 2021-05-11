Return-Path: <SRS0=jjA7=KG=microchip.com=Eugen.Hristev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E8AC433ED
	for <soc@archiver.kernel.org>; Tue, 11 May 2021 07:13:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41B066192C; Tue, 11 May 2021 07:13:24 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09376192B;
	Tue, 11 May 2021 07:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09376192B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Eugen.Hristev@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620717203; x=1652253203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UPGXRvLS3AgmuOFiWdkF2ik+v8HO4jPIF0qnh3jhSVc=;
  b=kgDBvejUagj+j7h5cYakYzLeY+TL2h3dCqXV5FoZh9Kd5UAXyUPwlNwY
   qyaOnWw8F9EaHuL7boTxzyyGeNQHHXcjIyjNSOzQQV5ZShmdnNYjzrF5s
   B/HdWVxANzGjIKidX/CNIop/WX5Ce4BAttB6NCiiBgTe2Rrph75zjWdtz
   QAgv7+qoxh1WS9s47LY4fhpHisFy6kcntCHXLwehxiRPbea470WGS22ZM
   AS8OW/1g83fwFHxkcI6LcOCnxypGjiNa9sfiEOfZe23jkhT/cBlsj1QK1
   KvqreBXqPyuY3DXgwvi0P5uQut5Hh8Vm4OgwwXGuJbXecRMI2r1F/H38E
   w==;
IronPort-SDR: XMxXAyrLS3ldPSaQWeJEu77H9TVVKmwM/AQs1Z0ydD/qLX2BnKFbMeMXSNao5u+vx49/aYz/I8
 Dq90JI3+fVChdKL/camTqLLjmQVGk6JxGCv+1jRBLd76e7T9e3W2fai9tJ7w7f8CrH3fzKfQ1E
 yJ7v9dwvAtjlKUmGmntNhEL8qiZeSbf/25rHsSql24xXsTuEd/D+i/OlJ9Zew6uF0O5/MzAWyA
 /zKpu2iHDf4QFwzoF2cFgChTsGH5PBdnlW23V5esJBZ9ZGgRkTqEfVh4T1j5pdupRzJpvHdANQ
 VaY=
X-IronPort-AV: E=Sophos;i="5.82,290,1613458800"; 
   d="scan'208";a="55126095"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2021 00:13:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 00:13:22 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 11 May 2021 00:13:13 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
	<soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH v2 4/4] ARM: multi_v7_defconfig: add sama7g5 SoC
Date: Tue, 11 May 2021 10:12:23 +0300
Message-ID: <20210511071223.71379-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511071223.71379-1-eugen.hristev@microchip.com>
References: <20210511071223.71379-1-eugen.hristev@microchip.com>
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

