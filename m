Return-Path: <SRS0=+GD3=KC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAA7C43460
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 May 2021 15:29:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28CDD6128B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 May 2021 15:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28CDD6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yi/RwJSb//c5R81wsyHYWEa70Ck1soO+3+nv2M8ASSw=; b=VSjcv9F6M2w/OMvO5WnJEhDh/
	ACrl7iG/Nz8tGsZ6+85/Aed2+BfdGB06U6OBORdSQlKkIHwBViasgxFFDS73KW6TeE3NnorN7t3Vg
	nvCz/lRr3bKJlgHQZsK+I3wK3MAnj2lPttcTOq58NObB+etsYIpdsem218Nwkd54vj4K14Hq44bxW
	utM2oFPkKUu0IivGrmF5Hy2S/rq1orE8kYdv3VJh1R6fbPzcjT1+DF2FmeKgegQqTQTUGl6QvZ9jF
	kk4NqDow4NbV++az3jr79S9BXBw1dCUoK+0ugod80qHPiH+rQDIcHLU3Hu3U4wxCBI1RDI/k7wGRZ
	VtcwNtnNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf2OX-007Pw3-Pg; Fri, 07 May 2021 15:28:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf2O8-007Prs-Sa
 for linux-arm-kernel@desiato.infradead.org; Fri, 07 May 2021 15:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=19tbxLPSe6QgQ8VoTQQOBJuR3jgSmvLMGZ3M5RpD8YM=; b=pjXmmLdaGWLgsViRIzXtazrHEr
 HDVikzWh8i8OYRT+Og7qS8O2MdsLVxckZREr93Fqr1iap5/xUCDugP7akqc96ABfHn+uwY0noFhe9
 AYAsqD/xL2taTzy1Jzm0EURv5Qm33ychydD7rVp8ZU/LyaQDS7ib27pqO+aq11h82+8cVmpd3HkOv
 RU5WfaSq87/Q/puYyCQwgCd4gpcDP7kSlqWWlRWLYEdPqY6IBPRUVQQIeeDw4goh4lmgXAXBovA1U
 H3zwLvUw4EPgeLwzDMitsVI0Z7RS23ToXpsYR1kitOcDPlvJ6n2BRsRDOS0vbfxw0xpF0kcgUrru2
 VJkZW7Zw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf2O6-006xiE-Gu
 for linux-arm-kernel@lists.infradead.org; Fri, 07 May 2021 15:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620401254; x=1651937254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UPGXRvLS3AgmuOFiWdkF2ik+v8HO4jPIF0qnh3jhSVc=;
 b=yQZe01bJ7ZyOm3EUzCMavUKUTSI1v0tjj81Tfhb4m9qt1gXGWjZQQSGi
 7qdVuo9nXusDsI5lNwt++0IUjabzfK17d1lJqm3pxIc/8h9apgMKwtpJT
 /vq8esqLyvRH2+4ra3pFMiI24VgqKWb4sdHa/PuyJ7vjvFDuYNn8pY59L
 YBfjcmVrN/96yx75ak9erA6smf/mrPnPHWqA2VhEekLFTy42cBdK5NEq5
 a58JmFWF150AFmsqstsuH6v6Y17lbMEdHHmbb4YN8CGPi2WTDvbeSRj7F
 ffCy/WX84xeW6KVmpScC95bKHxreadMgLgYHRbglvb+J0GHQtsnieag9D w==;
IronPort-SDR: U6/7l8IY2o3t11dx78wj+wUksP9NxajQsG0xixKfIV7+OsOoLsgfZN9Q1wVEgQseisTA72wO4Y
 ZcqMxRnz4gox9a/qesS3ZRknFVM77nDfWnc4bbmHsojxmssQEa6TPd1c5MbSOlzyPV+vBz0c5c
 Jf+1u7U3ymaiwOsjwLq2hhMnYuHs2jrr9oMRN08RywcDZYd2Wd+A/IqSmgfU8tuswPFlRkrwja
 mLrMAHogrkXmmdTMCYtVSj1C5MYRlP3v3xDPE9jRy5KEVZGfgwoAZtB1sz7jjctD0EdT0UatiA
 Qrc=
X-IronPort-AV: E=Sophos;i="5.82,281,1613458800"; d="scan'208";a="126179054"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 May 2021 08:27:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 7 May 2021 08:27:33 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 7 May 2021 08:27:30 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <soc@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH 4/4] ARM: multi_v7_defconfig: add sama7g5 SoC
Date: Fri, 7 May 2021 18:26:55 +0300
Message-ID: <20210507152655.182558-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507152655.182558-1-eugen.hristev@microchip.com>
References: <20210507152655.182558-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_082734_587920_3A8C7115 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210507152655.2Vi2DoJOl8PvAIwgTdRlwPlsyYO0WhyTNAWbadZcbQI@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
