Return-Path: <SRS0=ak0m=X7=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF7BC43334
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 08:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3398C341C8; Tue, 26 Jul 2022 08:47:10 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60BB9C341CD;
	Tue, 26 Jul 2022 08:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 60BB9C341CD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658825230; x=1690361230;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9U1mkdUyKbzCBO7q90cuU9y68G122KuYrTFj1QB3h2g=;
  b=B8tyHQLdZv+SIv/fpgUXWQpOCpu6vbd4WQRQVkyIri1+AXD/Qz03V0LA
   awhmPi0Q1pDOfNxsIS6CqdLJdpe82ksajSQCMzf8mwb37sDwQfhpbMspV
   jr//MsnlMJHqIbva3VbxKo40H2qXarl+f1cHJQvktWqAUi1eMFeCybzNl
   KMklc+RIh6mXEFj2pf2YH+seGy4JatnGZ9VuChHH0WBOLPunbktfbCZEO
   VABB+DUSU8jySCKGB6swZPhUjxbO1Q4faLIVNVlIOCPb2XRqyicG3aoHQ
   5ttLfUWHFKmUPafUoNlPOW9vuF9KD9Dg9sksiBHnjN5YNm1KXmoIVlYO9
   A==;
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="173643989"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2022 01:47:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 26 Jul 2022 01:47:08 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 26 Jul 2022 01:47:05 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <arnd@arndb.de>, <olof@lixom.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea@microchip.com>
Subject: [PATCH] ARM: dts: lan966x: keep lan966 entries alphabetically sorted
Date: Tue, 26 Jul 2022 11:49:31 +0300
Message-ID: <20220726084931.1789855-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Keep LAN966 entries alphabetically sorted.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---

This is based on [1] which is at the moment only in at91-dt branch.

Thank you,
Claudiu Beznea

[1] https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git/commit/?h=at91-dt&id=6239b21bbc538e94a4362eb21b0d1479e2a0a1df

 arch/arm/boot/dts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 6a6166e3a405..f12c5c1b1c93 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -770,9 +770,9 @@ dtb-$(CONFIG_SOC_IMX7ULP) += \
 dtb-$(CONFIG_SOC_IMXRT) += \
 	imxrt1050-evk.dtb
 dtb-$(CONFIG_SOC_LAN966) += \
-	lan966x-pcb8291.dtb \
 	lan966x-kontron-kswitch-d10-mmt-6g-2gs.dtb \
 	lan966x-kontron-kswitch-d10-mmt-8g.dtb \
+	lan966x-pcb8291.dtb \
 	lan966x-pcb8309.dtb
 dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-iot.dtb \
-- 
2.34.1

