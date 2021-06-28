Return-Path: <SRS0=r0Cw=LW=microchip.com=Eugen.Hristev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F855C2B9F4
	for <soc@archiver.kernel.org>; Mon, 28 Jun 2021 12:05:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1641461477; Mon, 28 Jun 2021 12:05:16 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFD661C69;
	Mon, 28 Jun 2021 12:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CFD661C69
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Eugen.Hristev@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1624881915; x=1656417915;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D1JleMTnSO1ymCUdXh/+hDEDMbLr8UzAtT0hHDbs/TM=;
  b=l9sR77hlbGAGqzpquXG5IUEvNAccdqrWofSh7mG9AQmrlXdxiH/WwNWl
   O3gCDQEyYHoNu4iGSnTKbxU29Kghp7eMAdViE0iVm/9o6IrQFjq3F8ZFZ
   4pNmjTJxLF5MuMKdPPSQCwfdsIW0pJYowUoUDdMb9vMQqEty0v+zPpnXt
   zltigpx2hlS7KUi62TKbfc34EfhGDO7bBaxLY2II0j+gyx3kYixY60orm
   nnhNdz8IqjYUi+ydlk1lOOntdSzQMWnD74cCxxkssVVy9+oJ1/NHQz6uj
   7Dd1EdwRKdgItWfbHc7TAged7Ffti6H0RjwNeKU8Q4vLXrNahzNi/eF1i
   w==;
IronPort-SDR: uwNKe2ztjzkSoZGpMhZPcQBzKONsvPI90wvwmw83jXzu6M4nMLglu7agH0C9ywbvwzXPyenmqn
 jaAJDFCBZXLTazW1z4CaUNSnTS9mc17nEmgYkjq4GhCOGI4A0ld6xftoTTomhKb7Yr76eW1yqO
 DMCPDQORGogJG0SVGNDwIDPQu2RP/GuF+we9bFiaFMtNEFSL4Qnxp44ez8o0ML8xcBYM4kph2s
 QBxxDohXTRE1jZjiwkNDFc1VF/Xi+uklkp56P2AFv2IfVIz6T5uVadpo7PsSm12dZfsCDFB+w7
 ZqA=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; 
   d="scan'208";a="120256120"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jun 2021 05:05:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 05:05:14 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 28 Jun 2021 05:05:11 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <nicolas.ferre@microchip.com>, <robh+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ludovic.desroches@microchip.com>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Mon, 28 Jun 2021 15:04:49 +0300
Message-ID: <20210628120452.74408-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Document the SAMA7G5 Evaluation Kit based on sama7g5 SoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 6fc5a22ad962..fba071b9af1d 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -145,6 +145,11 @@ properties:
           - const: atmel,sama5d4
           - const: atmel,sama5
 
+      - items:
+          - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
+          - const: microchip,sama7g5
+          - const: microchip,sama7
+
       - items:
           - enum:
               - atmel,sams70j19
-- 
2.25.1

