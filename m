Return-Path: <SRS0=ZUzB=ZK=microchip.com=Hari.PrasathGE@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C43C38145
	for <soc@archiver.kernel.org>; Wed,  7 Sep 2022 09:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8ED49C433B5; Wed,  7 Sep 2022 09:21:37 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32001C4347C
	for <soc@kernel.org>; Wed,  7 Sep 2022 09:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32001C4347C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662542496; x=1694078496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/9aHsHgZ1bx2m1ecmUv0F/a/9E81F7IqXCvZoB4FNb8=;
  b=fq+CB6cOJs22c3iFqOC0p1utKvikGYACR7kqQ9SEDlY0YJypd5WRRioR
   tn+vMdnDGeVsMIObH9/UJG6a7QfNwOcxZ04qbiO2n6eOtvQyDbANzaxoU
   xvQEiE/lfJZ3NfwNbZwfmjYSks3+4+uoIqb/GDZkTzksiFlAO3mY7Qqht
   KVVScAdMLuyor0BmUoXrxZ3yzMT14s2cAfcMLrFxW/dW2bCOxHSrFqwgt
   QMfrvA4KZ+/Wy7acCpFUvFNxgu/6zBvvEh0NkzpT2lAsbwaLb4rq1DH5U
   xHp32tG+gyPIAD847ILTiihqzbs7+qVC6gn/JoCxhrTAfG3Pyh+cDHIxV
   A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="189761633"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 02:21:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 02:21:25 -0700
Received: from che-lt-i63539lx.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 02:21:19 -0700
From: Hari Prasath <Hari.PrasathGE@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>,
	<davem@davemloft.net>, <krzysztof.kozlowski+dt@linaro.org>,
	<alexandre.belloni@bootlin.com>, <arnd@arndb.de>, <olof@lixom.net>,
	<soc@kernel.org>, <manikandan.m@microchip.com>, <michael@walle.cc>,
	<horatiu.vultur@microchip.com>, <kavyasree.kotagiri@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <durai.manickamkr@microchip.com>
CC: <Hari.PrasathGE@microchip.com>
Subject: [linux][PATCH 3/6] ARM: dts: at91: sam9x60: Specify the FIFO size for the Flexcom UART
Date: Wed, 7 Sep 2022 14:50:51 +0530
Message-ID: <20220907092054.29915-4-Hari.PrasathGE@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220907092054.29915-1-Hari.PrasathGE@microchip.com>
References: <20220907092054.29915-1-Hari.PrasathGE@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Manikandan M <manikandan.m@microchip.com>

The UART submodule in Flexcom has 16-byte Transmit and Receive FIFOs.

Signed-off-by: Manikandan M <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/sam9x60.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
index f0e0dc20de1b..224b406c8384 100644
--- a/arch/arm/boot/dts/sam9x60.dtsi
+++ b/arch/arm/boot/dts/sam9x60.dtsi
@@ -207,6 +207,7 @@
 					clock-names = "usart";
 					atmel,use-dma-rx;
 					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
 					status = "disabled";
 				};
 			};
-- 
2.17.1

