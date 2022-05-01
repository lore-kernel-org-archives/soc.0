Return-Path: <SRS0=ovHZ=VJ=startmail.com=hanetzer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFE4C433F5
	for <soc@archiver.kernel.org>; Sun,  1 May 2022 05:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DE31C385AA; Sun,  1 May 2022 05:10:52 +0000 (UTC)
Received: from mx-out2.startmail.com (mx-out2.startmail.com [145.131.90.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C672BC385AE;
	Sun,  1 May 2022 05:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C672BC385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=startmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=startmail.com
From: "Marty E. Plummer" <hanetzer@startmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1651381846;
	bh=CJkQRIMYjHGkPOoD08ZRSBh5tWFuR3jmLS/jherWFo8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From:Subject:To:Date:Sender:
	 Content-Type:Content-Transfer-Encoding:Content-Disposition:
	 Mime-Version:Reply-To:In-Reply-To:References:Message-Id:Autocrypt;
	b=o67qEAg5gAkd6aO3l0M/uuD6stU6h4qJ4oopGC415zc5pO2zQTW329j2QcqnSRTOh
	 7zYDEcn08hRVwpsrvv/BCHLybFI0XmctjQcw5z68oRt3l+LCnQYfoIhiVv8OPYuyYv
	 uu+JuDHkVz6RHZbwLfsdN1o2g/zfOHJhw9ivo2TrIr5wbT3bZrQwx3NCvkLcyrLzZh
	 YIV5sOWL3oGj9lFhE7MDb4DG5wVYhKuPUbb3STmPok/1UT+dPKSNvkcvWgMzwRigbj
	 86SaqawgnxBpX+SMQU/Ntv1GkZFYWA6zZXpBGnWnar6AfLxTcIzdgQjDggVBTCgeLS
	 0nkd+nCCRZd1A==
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Russell King <linux@armlinux.org.uk>
Cc: "Marty E. Plummer" <hanetzer@startmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm: hisi: enable Hi3521a soc
Date: Sun,  1 May 2022 00:10:20 -0500
Message-Id: <20220501051020.2432338-3-hanetzer@startmail.com>
In-Reply-To: <20220501051020.2432338-1-hanetzer@startmail.com>
References: <20220501051020.2432338-1-hanetzer@startmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Hisilicon Hi3521A/Hi3520DCV300 SoC. This SoC series includes
hardware mutlimedia codec cores, commonly used in consumer cctv/dvr
security systems and ipcameras. The arm core is a Cortex A7.

Add hi3521a.dtsi and hi3521a-rs-dm290e.dts for RaySharp CCTV systems,
marketed under the name Samsung SDR-B74301N.

Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
---
 arch/arm/boot/dts/Makefile | 2 ++
 arch/arm/mach-hisi/Kconfig | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7c16f8a2b738..535cef3b14ab 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -242,6 +242,8 @@ dtb-$(CONFIG_ARCH_GEMINI) += \
 	gemini-ssi1328.dtb \
 	gemini-wbd111.dtb \
 	gemini-wbd222.dtb
+dtb-$(CONFIG_ARCH_HI3521A) += \
+	hi3521a-rs-dm290e.dtb
 dtb-$(CONFIG_ARCH_HI3xxx) += \
 	hi3620-hi4511.dtb
 dtb-$(CONFIG_ARCH_HIGHBANK) += \
diff --git a/arch/arm/mach-hisi/Kconfig b/arch/arm/mach-hisi/Kconfig
index 2e980f834a6a..165ffb972157 100644
--- a/arch/arm/mach-hisi/Kconfig
+++ b/arch/arm/mach-hisi/Kconfig
@@ -13,6 +13,15 @@ if ARCH_HISI
 
 menu "Hisilicon platform type"
 
+config ARCH_HI3521A
+	bool "Hisilicon Hi3521a/Hi3520dcv300 family"
+	depends on ARCH_MULTI_V7
+	select CACHE_L2X0
+	select PINCTRL
+	select PINCTRL_SINGLE
+	help
+	  Hisilicon Hi3521a/Hi3520dcv300 family
+
 config ARCH_HI3xxx
 	bool "Hisilicon Hi36xx family"
 	depends on ARCH_MULTI_V7
-- 
2.35.1

