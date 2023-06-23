Return-Path: <SRS0=BfWA=CL=microchip.com=Varshini.Rajendran@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A79C0015E
	for <soc@archiver.kernel.org>; Fri, 23 Jun 2023 20:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16952C433CD; Fri, 23 Jun 2023 20:39:52 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04860C433C0;
	Fri, 23 Jun 2023 20:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04860C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552788; x=1719088788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BdWVxRk/sfsAxZ1mW04Nt1w0W11icyyMsW/XnDjycFE=;
  b=QqWrDhWQ2dz2s+8iTXx7KKE69G8zF+shm+1GzIrc7K3Om7xOp/q2wcvd
   YyiRIS0YODP/+ooIz6rZkniYA0jk22sibl/Y6jzJ7G5dNml8OpmL5aAbH
   x09SCeZxD9wFVm3Osv14ShE9cQNUrVtcm2bXpoSExT50lXJO3Q/aDuXWc
   QKIk49hY3v/PL6P4bO0Aykp5Gc/GyyWBvjh3Uh2FDHArPyGyIZLRlmKvs
   yVYkfyIrPwbYfjle0hEsOTFVlyp6YPArHOrntPNop7/wTjQ22a9KVsDu3
   4PjD5nnUwyfAZ4jreKtPYpHXlswcx7VugrzpLPaYF1sO4pmr95X9Iht+H
   w==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="220216874"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 13:39:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:39:46 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:39:18 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <vkoul@kernel.org>, <tglx@linutronix.de>,
	<maz@kernel.org>, <lee@kernel.org>, <ulf.hansson@linaro.org>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<olivia@selenic.com>, <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<linux@armlinux.org.uk>, <sre@kernel.org>, <jerry.ray@microchip.com>,
	<horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
	<varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
	<alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
	<mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <manikandan.m@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>
Subject: [PATCH v2 17/45] dt-bindings: dmaengine: at_xdmac: add compatible with microchip,sam9x7
Date: Sat, 24 Jun 2023 02:00:28 +0530
Message-ID: <20230623203056.689705-18-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible for sam9x7.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/dma/atmel-xdma.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/atmel-xdma.txt b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
index 510b7f25ba24..f672556ea715 100644
--- a/Documentation/devicetree/bindings/dma/atmel-xdma.txt
+++ b/Documentation/devicetree/bindings/dma/atmel-xdma.txt
@@ -2,8 +2,8 @@
 
 * XDMA Controller
 Required properties:
-- compatible: Should be "atmel,sama5d4-dma", "microchip,sam9x60-dma" or
-  "microchip,sama7g5-dma".
+- compatible: Should be "atmel,sama5d4-dma", "microchip,sam9x60-dma",
+  "microchip,sam9x7-dma" or "microchip,sama7g5-dma".
 - reg: Should contain DMA registers location and length.
 - interrupts: Should contain DMA interrupt.
 - #dma-cells: Must be <1>, used to represent the number of integer cells in
-- 
2.25.1

