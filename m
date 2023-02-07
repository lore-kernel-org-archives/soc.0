Return-Path: <SRS0=Wnfl=6D=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89452C636D6
	for <soc@archiver.kernel.org>; Tue,  7 Feb 2023 11:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FCD7C433A4; Tue,  7 Feb 2023 11:07:55 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5689C433D2;
	Tue,  7 Feb 2023 11:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5689C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675768074; x=1707304074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p6Kji/TJYZJzNMpJy1w1p5Y3R+ZBdEpdO8oW5jbtFpc=;
  b=i1mXstWwtZu3I1n4BLAREc5PB1MVd34CPUZBQVfqVNZK09YMJpBwSdq3
   x7CfDppFazkCRYRP/61iH3ikCqvMgI+ZFNOfTn2sw7oETQg74WYkidrGe
   SYzwKe7+Tm/jsJ84CVyPfGu3k/wGvrhEVcmmoM2dRFIy1c7fLc9lpE/Uo
   ripRqg6eIiZWmYsYm9ZFemHBVoz3MkAB6SeUKIsn9o5MOPy3pIC8DpUaP
   GI5+GHqQCYP9e98MpBK0WUHvrXDxJTu8Or3vodVmIrzQETt8/OUb9Nmx8
   MaJuXnaxxkIhDVYcHskTQb6hdp/PrBQGFBkiqiy5Xq73uHdDS82Ig5PCr
   A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669100400"; 
   d="scan'208";a="195720583"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Feb 2023 04:07:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Feb 2023 04:07:49 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 7 Feb 2023 04:07:39 -0700
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
Subject: [PATCH v6 3/8] ARM: dts: at91: sam9x60: fix spi4 node
Date: Tue, 7 Feb 2023 16:36:46 +0530
Message-ID: <20230207110651.197268-4-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207110651.197268-1-durai.manickamkr@microchip.com>
References: <20230207110651.197268-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The ranges, #address-cells and #size-cells properties are not required,
remove them from the spi4 node.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index 4ff84633dd43..6b6391d5041e 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -232,8 +232,6 @@ &flx4 {
 	spi4: spi@400 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx4_default>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		status = "disabled";
 	};
 };
-- 
2.25.1

