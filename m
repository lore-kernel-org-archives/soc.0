Return-Path: <SRS0=FZW1=DE=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7159DEB64DD
	for <soc@archiver.kernel.org>; Tue, 18 Jul 2023 06:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B522C433C8; Tue, 18 Jul 2023 06:58:07 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EE82C433C7;
	Tue, 18 Jul 2023 06:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EE82C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689663485; x=1721199485;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P6VvQvFvwkNOAOvrLhOm+eEGUjR865o3HtvDrNiPEjE=;
  b=AO3lsVNgIzVNckV6NseCBooJtjbcpb/Gq5PHQozISokhob1FQ94yYeY3
   +42Rh2mCtlBghYLfHC8+TFoPKYtk97Y48XIgSqqpNX5NW1UPMmfr4cu2y
   sf3eKCp3mW76FUTRdFqEyQ+wnSD3gGOYqtyVoJD8UZoZCa9/ss4fLhu2R
   Wa1otV5l5XhEUUE2NwY3d+U0QxMgOFuGTyXy5MFws5vhpAd4UniXwLEqQ
   VtEgl4THU/SQb89zmkwZlEUSVOhT/e5Y/o7cL4M+H/ChRIAbH9CTqsLpE
   Kh5df2RYPjcPTjFcHorcJJ4vxSBt3bkcxwNkq4pZNHSJmEbFbSy/1P9ha
   w==;
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="236147753"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 23:58:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 23:58:03 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Mon, 17 Jul 2023 23:57:52 -0700
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
Subject: [PATCHv3 1/2] dt-bindings: serial: atmel,at91-usart: update compatible for sam9x60
Date: Tue, 18 Jul 2023 12:27:34 +0530
Message-ID: <20230718065735.10187-2-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230718065735.10187-1-durai.manickamkr@microchip.com>
References: <20230718065735.10187-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is only one debug unit in the sam9x60 SOC and it has the chipid
register. So, the dbgu compatible strings are valid only for debug usart.
Defining these dbgu compatible strings are not valid for flexcom usart.
So adding the items which is valid only for flexcom usart and removing
the microchip,sam9x60-usart compatible string from the enum list as no
usart node defines only this specific compatible string.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 .../devicetree/bindings/serial/atmel,at91-usart.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
index 30b2131b5860..65cb2e5c5eee 100644
--- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
+++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
@@ -16,13 +16,15 @@ properties:
       - enum:
           - atmel,at91rm9200-usart
           - atmel,at91sam9260-usart
-          - microchip,sam9x60-usart
       - items:
           - const: atmel,at91rm9200-dbgu
           - const: atmel,at91rm9200-usart
       - items:
           - const: atmel,at91sam9260-dbgu
           - const: atmel,at91sam9260-usart
+      - items:
+          - const: microchip,sam9x60-usart
+          - const: atmel,at91sam9260-usart
       - items:
           - const: microchip,sam9x60-dbgu
           - const: microchip,sam9x60-usart
-- 
2.25.1

