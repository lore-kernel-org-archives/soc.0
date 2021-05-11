Return-Path: <SRS0=jjA7=KG=microchip.com=Eugen.Hristev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93A0C433ED
	for <soc@archiver.kernel.org>; Tue, 11 May 2021 07:12:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8917261926; Tue, 11 May 2021 07:12:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD1A61920;
	Tue, 11 May 2021 07:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FD1A61920
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Eugen.Hristev@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620717160; x=1652253160;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D1JleMTnSO1ymCUdXh/+hDEDMbLr8UzAtT0hHDbs/TM=;
  b=Uk24sUEESi6W87sAuit+oqUTtP7oVPHrTUizRJYkAgWOSoIaIwYnb2gy
   OOWYd2J/5GsY3uCwiWBY3G2CSnOyGN6QYfGwVmVsUCY66zCOxCsDHG9qB
   /IukXeAdiEnYNjpNL8uFXBhDjQ3efGzklJUFwWGm62Ces72k4Z7KNWkGd
   Nc4V/mTi9boJDFpHMw4+dbhKDF4xDQBa5us4tc5fN4dWVwNLSy9BADlP8
   h7428SAr3LKSmaIylEkj/ajbGRzMXi/Plt36ARGjBGeiC3IzbQNjaqxDY
   BssYncNcjiYSdJ0dIrVeHUO819UaSVVO584biw+2AR2IXSjKARJoPKlxO
   g==;
IronPort-SDR: U1wcL16wsUcFPGnZ+c2LFMisb+Y0E+3rqgCPM/aSODXfWAAJ/O4hqnh6Dlb6GtSJzMV9Tem+j1
 1CG6q4BcCf3QKpF/vt89DI6OjhNOkOFRVjhzqA3w4pMNHWtGzivgmx7eHzSKGu8lqXhr2/OYFj
 hIo4blqIl91FUgYbLRQQ/jJHp3DMqadRQaH+4WCPKyCJVbroZEtisXJzEsLuNv8k85pO1s05YN
 6hI5KTz91/p0bV4V5499ZwFnJxIBNAqliTofX/2rknWbaZDAFoioMmjP7lM4Fpk8axFoMWL0SU
 ZKc=
X-IronPort-AV: E=Sophos;i="5.82,290,1613458800"; 
   d="scan'208";a="121163380"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2021 00:12:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 11 May 2021 00:12:39 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 11 May 2021 00:12:33 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
	<soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Tue, 11 May 2021 10:12:20 +0300
Message-ID: <20210511071223.71379-1-eugen.hristev@microchip.com>
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

