Return-Path: <SRS0=3VtK=KJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4BEC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 May 2021 08:25:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D72061451
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 May 2021 08:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D72061451
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yi/RwJSb//c5R81wsyHYWEa70Ck1soO+3+nv2M8ASSw=; b=q6q2rbRlX4u0vBOOg5sJYqFlt
	Tb66ORqMpSTHFymHfs1hAwcb9zVN1f+EQLm7Mev4xmYaa3nzQOQ9ME2iMX4pdCxEBI6S65UnjVCVW
	KmZIh9a3f8msqi4FUJV4skWssmdpMxwoVH+5hNKSb0MZPRyiU+mV3vgKAWj8zLTOxyvkf1JMaR+bD
	8SIFbICd3v+xns7jx3ka/k0xWZPuoojpf0MyQ3LWZ1MTEmN587cSRhYW26b4p2DR8DgI3MzbusLj9
	QUB7GVXHgY/h38l3eDwq6dZukQf+XEkIyEYb79O1C9dJhLbY9hm0JDecEACMm2kY1SIakWZL+ztmD
	QA7BWzoaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhT6W-007TtS-Cd; Fri, 14 May 2021 08:23:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhT64-007To5-CN
 for linux-arm-kernel@desiato.infradead.org; Fri, 14 May 2021 08:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=19tbxLPSe6QgQ8VoTQQOBJuR3jgSmvLMGZ3M5RpD8YM=; b=jlIsxSYXgpLI+0+r4TgU0OM1J1
 QBBsQr99B7wSCWyop2Uyhvk6rTZDUWrsHUGB7PWETTg2wQB1egSC96Ylf7VonmE6R+15VSbchuSUe
 bUUA4eXn8TrcVAhIKgjLdt0IE2B6lQPqxEj2FtEgQ6godIqS4cb8Ff0FMe1TLaiLaTkxnKLPvEGNA
 u1bEM5G/Z5j5k6ySZ3KvUxOQxb8jtkD/KYNwAboRsGHopvnBMuryJ0HNCHFAzII7Kq0mSAegh7wuw
 YboD9EqfvKIzbXyFhToR90PJhfpJuRVqBaA7V0NS1QSev9HsV0YZS6QxrGtzshnhmA728+2XHETjO
 2DdU/mXw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhT61-00BoVF-VS
 for linux-arm-kernel@lists.infradead.org; Fri, 14 May 2021 08:22:59 +0000
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
 YvkN2CnkH0u0qFuq12WRq1YR/EqQzNQgH+CE1Abcb6DbTkMvXzLAnyAFo w==;
IronPort-SDR: u4UE5UOXQfY44f7yKsGNKLrT3uBCPvUWWwWuECIcY5Bc59XNVrQNbgWCbUBakI2cTtcsAHwuq9
 /P8AUCI7DSHF3Qui7hpamDiROxeQ5k6NHvrjFZiE6tH4cDG6a+7pFzTEfocww9UBneHF+Qxs5q
 wi2PggfGToNxBMUBmKEaFggPA0K+e1+aNGoGNExS+LMHsM0Bl1H3vjd7fH2LF9ULvQ+1du6fTw
 +Vn0+QFeovs+tohSGuor6JFhFarGQo0wSPTIGyyNRctSQ+aQtt0lzUT0AkKVsK7E96EEdIa6YM
 sOw=
X-IronPort-AV: E=Sophos;i="5.82,299,1613458800"; d="scan'208";a="115307201"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 May 2021 01:22:56 -0700
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_012258_092728_5E04D053 
X-CRM114-Status: UNSURE (   8.17  )
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
Message-ID: <20210514082151.fZP8uVcZzCcoX3q6y26hCzl24_CB5HiD9bXgpOEH6i8@z>

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
