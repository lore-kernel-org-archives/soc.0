Return-Path: <SRS0=VKAG=KI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEA7C43460
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 May 2021 06:16:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1356D613C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 May 2021 06:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1356D613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yi/RwJSb//c5R81wsyHYWEa70Ck1soO+3+nv2M8ASSw=; b=WpUya5SQxc/FXiVe2XKqDNMTL
	pSe4TvPtWovwNhMxIovnE4UxSYTLAxvv+i81943WkZAUJC+1IZkgi9XgAWAt7SGBPG+EVIeCPaJFM
	Ew5fOKk7LTk6YgzqwZTVDUN0gxwbHLsmUmdDKEu6Ngs+XUqRK8lO0Tzz8heNqtlY1UZdCF9IDL10H
	GWaeQb8V0ejDy8rNVo+dMyZl2nX7PzMYftgT+7FNifh/i4tSChh8mZgDQ0FfgioIw+D3Kw7R8yGSV
	mW+L+EOEEqNieN/DX1tXM/KkaaV8aZ7IqOsTuAPBZ5V/y15CkEiMO8y6YKar53dPEm2KqAMhcE1eq
	gr09SgHdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh4cZ-004rvV-BO; Thu, 13 May 2021 06:14:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh4c3-004rs7-7s
 for linux-arm-kernel@desiato.infradead.org; Thu, 13 May 2021 06:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=19tbxLPSe6QgQ8VoTQQOBJuR3jgSmvLMGZ3M5RpD8YM=; b=ZsPtmHz4kZ9G/D25bDFI3b/pT3
 WiD60gvZUuPRo0wth7IBrlIBZmyVhacMBxnPbITcEuPf4m9m9dKc2Sx90KdtsHaxLRW0eKkrQokIE
 omGHZz6U2N1WWBig0GyVzYWwWuxy5Kfz0/k6tqiNTkJqPYPtuXkopI3UJaaL8j+9WfTYcGhiHaR4D
 0TwoqHIF9+CZi1ZhRr0lJeqVwuKyHf6dg5jt1Pg4TRHgk7RnkkBM8Hhf7P6XwPmXOb9k8DE3hkBAU
 v7uqDcpn9oJBwErPyLoEWTUR18zVTeBpZlE8KezZJvH+08sOJVww22S2h6FFPiS7Pqzzg9IRNpTWO
 VKb/2RpA==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh4c0-00B2Yz-Rt
 for linux-arm-kernel@lists.infradead.org; Thu, 13 May 2021 06:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620886461; x=1652422461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UPGXRvLS3AgmuOFiWdkF2ik+v8HO4jPIF0qnh3jhSVc=;
 b=1v33s3dQ18/qQ0u9Q0dfBCWYHV3egxleNUclrnywcU1yDz90Y3cKVflU
 qjLY33b6w7i7QlyC0ZBvRVvebKS6TXqDmR88bHVt/fhurQgN/uJ15pKrC
 TcM1kPJo4uOzIallv0frtN+7siIHKfazCKly3LcSYT3vfapZnxfcbokAG
 csV4EV7Izh6bB/X6BjS9QV6ErmHJ02UA8G9+k8Xt85a6YxTLMKj1Jfezn
 zu8LyEzt+77ppIcU036Rw3EHh8xVA5hTe+sULKz14uQthH3VjMwzJ0B70
 3gxYBYSyzzm/uacTnSs6Bjz4lojgbFTHKJjP7Y1n4DBITy0GGvsm7hS/p w==;
IronPort-SDR: wr6JlxQDQfEF0+Dged10nrFeSqTEXDK0qa7XktPdqty06We0Q2nevPMJS1l3VN3CoyvWv1W26y
 AXCes59kjRckECn5P1Kv/uvQSAMekGmUCkyKOr/CsKoS4EJNWFWg6pdFJEdF3RGRiE1lP8kCX6
 ba51gZ2tpl2jPE8vm1v99So2Rp2EPJuhSMqzYSkZl2W344HfFHFtDReDP2moPt3XSxmD4oylfv
 U3mZtsRFOIFTL/Jg+6RKElZrWi4MsmAo5HtzC45LkUI2c4r5vVDt55p7luFkFLMLGmtFsHAY7+
 pog=
X-IronPort-AV: E=Sophos;i="5.82,296,1613458800"; d="scan'208";a="120906635"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 May 2021 23:14:21 -0700
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_231420_927841_0BD865B6 
X-CRM114-Status: UNSURE (   7.93  )
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
Message-ID: <20210513061354.9p-kkqHEklRFferJmIDYg2di7CuLMVW_G7sqKkCcjmM@z>

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
