Return-Path: <SRS0=QxmZ=57=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A22C636CC
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 03:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C078C4339C; Fri,  3 Feb 2023 03:50:11 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BB60C433EF;
	Fri,  3 Feb 2023 03:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BB60C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675396210; x=1706932210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cMvbIa3FLCRSl3fQRWvqEpoBzJYKfBeBfB2mYetr3uk=;
  b=kH8mNbEVlzka2ozRIkCdWmQID1nNROVj2g4WvWFl3TfA9O7LdcnnQzBo
   xaoBv5WRaAnYW3JfghyVg6cAmhCoz5Vlnto/33K6Y2UhScOKkjz67O+TG
   xc310f/uheBqbutVyHhMZQ9SVxMtdNRBZYgezVSrL/j+u3H1ya1wsOAtr
   18ljkA2cMto2kX12r9PsJM7ZFlCQZxSeKW8njkQ8S0KJF+shnEvqSL8Pv
   Uwn/COQc9A3Sq39NlmQsN4y+H8yWQR8DhSUy8t4C5NDeYbIKGc2/hiEso
   J8zHyYtNW6vndguT6F7HTshU9P7NlL7RreJApMOXwJFJObHi3phlTAbVs
   w==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669100400"; 
   d="scan'208";a="199411147"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 20:50:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 20:50:08 -0700
Received: from che-lt-i66125lx.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 20:49:49 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <Hari.PrasathGE@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<manikandan.m@microchip.com>, <varshini.rajendran@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>, <claudiu.beznea@microchip.com>,
	<cristian.birsan@microchip.com>, <nicolas.ferre@microchip.com>,
	<krzysztof.kozlowski@linaro.org>, <alexandre.belloni@bootlin.com>,
	<davem@davemloft.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Kavyasree.Kotagiri@microchip.com>,
	<Horatiu.Vultur@microchip.com>, <robh+dt@kernel.org>, <andrew@lunn.ch>,
	<michael@walle.cc>, <jerry.ray@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH v5 4/8] ARM: dts: at91: sam9x60: Specify the FIFO size for the Flexcom UART
Date: Fri, 3 Feb 2023 09:18:29 +0530
Message-ID: <20230203034833.451461-5-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230203034833.451461-1-durai.manickamkr@microchip.com>
References: <20230203034833.451461-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Manikandan Muralidharan <manikandan.m@microchip.com>

The UART submodule in Flexcom has 16-byte Transmit and Receive FIFOs.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 arch/arm/boot/dts/sam9x60.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
index ee6cc4329ae4..1e401a919f56 100644
--- a/arch/arm/boot/dts/sam9x60.dtsi
+++ b/arch/arm/boot/dts/sam9x60.dtsi
@@ -209,6 +209,7 @@ AT91_XDMAC_DT_PER_IF(1) |
 					clock-names = "usart";
 					atmel,use-dma-rx;
 					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
 					status = "disabled";
 				};
 			};
-- 
2.25.1

