Return-Path: <SRS0=FZW1=DE=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E0EEB64DA
	for <soc@archiver.kernel.org>; Tue, 18 Jul 2023 06:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 737C5C433CB; Tue, 18 Jul 2023 06:57:56 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47BBDC433C7;
	Tue, 18 Jul 2023 06:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 47BBDC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689663474; x=1721199474;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KB6wQi2fSkHzaNEB8uUFd6EhlNuh6Xp2A6Y58nxMss0=;
  b=t3GLTPrTG5zSFQA9FFyWdPNQMro77FxxNtOSkH7Dkr2UKB9kMIRixALi
   iUqMa6X9Oyiunb8FEtiSVMAopasYYRDFAwi/Cz+16kee5a0elaWBlMub2
   3dsm61/WaEC45I0Mu7cqBY6S2+Uhv99097Wnc56EkUVEog8kxrg7aw00g
   20LxZqydza3t9SZ8b16u5wDNVGCsvQBvrLPubMS7gYKIP9DfZsvhiq0QU
   5XzDU1cPYap2vWzBFnTGWuAaDyaQ/rLii5XKLAXz9ohl/WDDuDAuGe7AB
   PCQ1+1THBSB8tAunv8psxfPLDKYRLGqS7cg7quJQ7utQrG3+Rl+X/2GNe
   A==;
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="224388338"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 23:57:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 23:57:50 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 17 Jul 2023 23:57:39 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <Hari.PrasathGE@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<manikandan.m@microchip.com>, <varshini.rajendran@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>, <cristian.birsan@microchip.com>,
	<nicolas.ferre@microchip.com>, <krzysztof.kozlowski@linaro.org>,
	<alexandre.belloni@bootlin.com>, <davem@davemloft.net>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Kavyasree.Kotagiri@microchip.com>, <Horatiu.Vultur@microchip.com>,
	<robh+dt@kernel.org>, <andrew@lunn.ch>, <michael@walle.cc>,
	<jerry.ray@microchip.com>, <conor+dt@kernel.org>, <jesper.nilsson@axis.com>,
	<andre.przywara@arm.com>, <ada@thorsis.com>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCHv3 0/2] update at91 usart compatible for sam9x60
Date: Tue, 18 Jul 2023 12:27:33 +0530
Message-ID: <20230718065735.10187-1-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is only one debug unit in the sam9x60 SOC and it has the chipid 
register. So defining these dbgu compatible strings to the flexcom usart
is not correct and causes the SOC detection failure. So removing these 
dbgu compatible strings defined under the flexcom usart and updating 
the yaml file accordingly.
---
v2 changes:
1. Updating the dt-bindings documentation and send one more patch for
the yaml file.
---
v3 change:
1. Explained the issue in the commit message rather than in the cover
letter. Added the detailed commit message for the changes done.
---
Durai Manickam KR (2):
  dt-bindings: serial: atmel,at91-usart: update compatible for sam9x60
  ARM: dts: at91: sam9x60: fix the SOC detection

 .../bindings/serial/atmel,at91-usart.yaml     |  4 ++-
 arch/arm/boot/dts/microchip/sam9x60.dtsi      | 26 +++++++++----------
 2 files changed, 16 insertions(+), 14 deletions(-)

-- 
2.25.1

