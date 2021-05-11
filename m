Return-Path: <SRS0=CwTY=KG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A88C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 May 2021 10:50:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600A76162A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 May 2021 10:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600A76162A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yi/RwJSb//c5R81wsyHYWEa70Ck1soO+3+nv2M8ASSw=; b=iuh84MGj7spchfftk6QEQIj9C
	Kw2rdm52H4yWv8/fROBzYlNWnCJGRiHkdtRl+gOsxQFQ8oknZNIlGwdn/M4ZBPKfh4F13WwBIOpgV
	G/Ojd2v3F/UluYBZWvtZv/LojN2c52Bigc1T1Wu6L1IqRwo4bF//fVKG1N4/TMvvHuZUD8Dx+Sv51
	6/2S8awhlDOQkCPvnEd2akiWKOUXap/SgZ5cmTBE+qwYqyfSlZ2RJQNmajxs6R6OMsHP4+juUoZsG
	WICgFMqtm4yamKpLVBYvJjOeQVr1dD9Gf8WxU0U8Dz3Nm+HEc2+8sSoQGXj591PcUKwiK54ifwG+P
	gl3181PEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgPwC-00H0ch-Fp; Tue, 11 May 2021 10:48:29 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgMa7-00GU30-Q1
 for linux-arm-kernel@desiato.infradead.org; Tue, 11 May 2021 07:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=19tbxLPSe6QgQ8VoTQQOBJuR3jgSmvLMGZ3M5RpD8YM=; b=PhOtSllG8faOmkxeapCEu3gjAY
 mOo9IwINgBK/+GsFAGHregJFYZJfMBYv1a6z52thjuP8YlFjGls6fk0NNBAuvgftBnZhwLe8GQnbP
 Lq4FcuesdsLyDuM4tgBCk9HI/XRS0KBTWxlCDOFK9i1xCk//As4scqItwS/0nHhTIGrZhVw8yXPRR
 TDSo8iOPBKoK6IZbbYpA3erHtWM71cBA7U0qyKmr5HNpPKL1PEcj4R0C6Np0GkUYfy0/9SYgtPIZF
 LRp4XshkPjRtlCyjKQtsBoiayTb/9L+nlfijiJ4U7ywaAKyw5sR9JuWiP4y6sN4W/0ypVDrjgzR+M
 KHScxccw==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgMa5-009M5H-6m
 for linux-arm-kernel@lists.infradead.org; Tue, 11 May 2021 07:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1620717205; x=1652253205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UPGXRvLS3AgmuOFiWdkF2ik+v8HO4jPIF0qnh3jhSVc=;
 b=ePkN+MsyqVhHqVTAkhaT96KKTky6F2OTyhWW9y/toqAaXrbT9CGmBjsn
 q5Bv5OIK52vc5O+S3qFjA2XpeRrKwwbH0eA9yzsXUstH88Ke6Qhmpt+XQ
 oEQo83R56RQnIduD3yIGOiIEIzh8oGDCh1Png/ICHQ8Ei0pHVHwwKtIxm
 Fs7H6d6JqikluqRHQH9CpVA9QXjjxOIyn5TsAgzfif0zOIpbBgkmBx347
 3eM+97JzC9i/fNkaXz/8Gluweo/c5MMgYfwkmV+3hG96zTVyFJX3uOKKn
 YHkcnZ27X0yibVOx95q8EsdzC5dldlz0gHneJdsjCNcQK4JRlh/O96qNK g==;
IronPort-SDR: XMxXAyrLS3ldPSaQWeJEu77H9TVVKmwM/AQs1Z0ydD/qLX2BnKFbMeMXSNao5u+vx49/aYz/I8
 Dq90JI3+fVChdKL/camTqLLjmQVGk6JxGCv+1jRBLd76e7T9e3W2fai9tJ7w7f8CrH3fzKfQ1E
 yJ7v9dwvAtjlKUmGmntNhEL8qiZeSbf/25rHsSql24xXsTuEd/D+i/OlJ9Zew6uF0O5/MzAWyA
 /zKpu2iHDf4QFwzoF2cFgChTsGH5PBdnlW23V5esJBZ9ZGgRkTqEfVh4T1j5pdupRzJpvHdANQ
 VaY=
X-IronPort-AV: E=Sophos;i="5.82,290,1613458800"; d="scan'208";a="55126095"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 May 2021 00:13:22 -0700
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_001325_327256_0160C7BC 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_001325_327256_0160C7BC 
X-CRM114-Status: UNSURE (   4.83  )
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
Message-ID: <20210511071223.jLGzR_WFosNJmZEQRNTfXP8ezRVZG25K1Ahro_wmbXw@z>

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
