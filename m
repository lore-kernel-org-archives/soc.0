Return-Path: <SRS0=YMvz=LW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762F2C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jun 2021 12:07:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DF2861C69
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jun 2021 12:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DF2861C69
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzyNX0h6cRk0N3kbsa6PAq/2vkW2LUEoV2dBY8PSn34=; b=p96cU4vOghpw2n
	nYcbpjOFWW6P8KlAMF05TlZYsQuXqnkRnrt0NOOkB6KJfYhLAQQhFjOWUfaXYLuMI7vIolBYXxiAK
	Tcwv+mvdhDPYrL1D5fbJ/As4wCXXEXjb3tBdCVQr/OMVRCy6nkw8rQV89g23UgH5bEUQEwAxOj8eV
	S7pCgvMBTfAb+ixU1M/GEhTvUjzu8dpjHNY2Y57rimaP1mhcl+I6MRBd6lGTOv4S8I3rapIeZrKLo
	ZDIqeI0G5KeUcZ/U6vPVDBpSo/h9cpHZSVdPa+IuP8MHYVxv+p4unQfbjRSjXwBOkhaeZpEniNikC
	SuGJxw6ylNOqiHVSvq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxq1Q-007rOd-Uv; Mon, 28 Jun 2021 12:05:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxq0y-007rJE-BN
 for linux-arm-kernel@lists.infradead.org; Mon, 28 Jun 2021 12:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624881924; x=1656417924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PaCSetCKwvtQGvTBWH5h3ispeHDjsJzITohck8b3c5g=;
 b=tQTR69XmNB1NG8i/pu0JgpQzKZcQjJMIYvybyGqsAUyV4oIZmzDgLr/g
 n4MPYYTe7kt2pG3kK0RcKBcT0xPOTd6GGiYqnvcqQn6PCO7TbPmIz/Wav
 +yJ+e+iFDfkkRVmSPtZbnhseelbE6eULAz9S3wBD2GQhASOsQzl+sbLGB
 6esUQVbebS4KCmifgqNjliGgC8rsdRq75RUQh+fQ387bj1jBCX3B7jWLF
 ECNCTaCeSg5FBlH0OX+nPfnyYR3k+WUrgNgptucBGajef3DNituZdZWvW
 /3brr7VDiVaHRDyLOzPdceXFW8Xg1w8Oi7L4OjF7rw+MDD96cNUe2XcwJ w==;
IronPort-SDR: 865UmXT1tBOZdFTzj2Jqa5XZNwZJ7NSDaQGuWC1NOSUe+2x6cMU/sjYRw5X9KLyiMYtABawFkX
 IfXpLEtFlv8coBHawKARQ3/XaUDFMVjU+FcStJPBZWbb0PlbiBmLs0dOsaglYtkg0hm3wOGhKE
 HsowOKoaGtZqTCnuGOGEr6Me3Qo00LbL94t/AZyKwYDnCnN9M5i5ih4PgTgt/9a4+YwZLiLTxb
 91HohmnQ5sjAhl2X4WrY5/EiFBqjePSzrd0zNwNbt2TN5PSqewykDlJw686Mq3pv+jNrpQ3ZMh
 Yhk=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="60442228"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2021 05:05:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 05:05:23 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 28 Jun 2021 05:05:20 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <nicolas.ferre@microchip.com>, <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <soc@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <ludovic.desroches@microchip.com>,
 <claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH v5 4/4] ARM: multi_v7_defconfig: add sama7g5 SoC
Date: Mon, 28 Jun 2021 15:04:52 +0300
Message-ID: <20210628120452.74408-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628120452.74408-1-eugen.hristev@microchip.com>
References: <20210628120452.74408-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_050524_507420_D1A11581 
X-CRM114-Status: UNSURE (   7.50  )
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
Message-ID: <20210628120452.0hsi4no_iSV8DepnSW7LjHjd1o-P2qfvKt7Fu666b4Q@z>

Add the Microchip SAMA7G5 ARM v7 Cortex-A7 based SoC to multi_v7_defconfig.
Also add it's clock timer, the PIT64B.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 52a0400fdd92..4a02c102128d 100644
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
