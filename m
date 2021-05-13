Return-Path: <SRS0=xIwT=KI=microchip.com=Eugen.Hristev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA80C433ED
	for <soc@archiver.kernel.org>; Thu, 13 May 2021 06:14:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E9F59613F7; Thu, 13 May 2021 06:14:07 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73FCE60241;
	Thu, 13 May 2021 06:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73FCE60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Eugen.Hristev@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620886448; x=1652422448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D1JleMTnSO1ymCUdXh/+hDEDMbLr8UzAtT0hHDbs/TM=;
  b=NEIu+8Ao79PFb2o43AmGcO4Hz/y4+i2OBEUxUzt8nBeaF2HXjfDH905c
   PpY+lFgeWv2qVqulsAEPMgRXUmPS55admve4Ut/tGkstoAKG19IDA65vK
   DUrRZjQrQX6rUzlIJdtOnKHTJ7agpXMTFmQ6NPofpSwmmlpDrMpcudEzl
   mPGtq0H8ACA4mXkLhmT+fLaQlJOX0xqaVwe68mlyqfANz7IrKSLMnePRg
   tWN0A9aSsCFcTcD78uaE5camil/ucUGoDTZIPVOnQgN8FkCAwsvJc4fxV
   GzPRguOJSuOacZABh3SfP7tIf9Ws7WqI5fG/PWuDMzgjsbZWeGrUZ51J7
   w==;
IronPort-SDR: k15+ZFnGZ06hmMnNi6eCmqkxd3VbO35iPqxDzc1yiAXCcPuzX3axntASUrut/nWmA14tBEUDb+
 IEvDh9swKcQoH//8FoR7201O1yBd5+BJZ4+4D11FSzuleSnoPqkXPVQIU7yPBxEVIS4YmDoLFA
 nL7Ii4bMIt5QnplTVfshBNkrdi9ktZexI/SIR4+0JfnHGPKqw+YyOiqbUUwIiZnmHjFRXUHGiX
 oGqQTFSlpH+K2ev6SLnI7iavsnE8EGRd/HpII0TgSwya0tFGXk6jGcAyMd4LmHdTOmJz+0bq38
 7Rg=
X-IronPort-AV: E=Sophos;i="5.82,296,1613458800"; 
   d="scan'208";a="120906595"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2021 23:14:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 23:14:06 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 12 May 2021 23:14:02 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
	<soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Thu, 13 May 2021 09:13:51 +0300
Message-ID: <20210513061354.138158-1-eugen.hristev@microchip.com>
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

