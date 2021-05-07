Return-Path: <SRS0=w4mC=KC=microchip.com=Eugen.Hristev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFEBC433B4
	for <soc@archiver.kernel.org>; Fri,  7 May 2021 15:27:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8678E6141F; Fri,  7 May 2021 15:27:23 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D716128B;
	Fri,  7 May 2021 15:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D716128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Eugen.Hristev@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620401243; x=1651937243;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pTkesFyIpyVjzbe9acZLbxNURxPk51YCjjVT18Qv9e4=;
  b=qqcpHZ82psskwA/vHcqsP3PpjCP0v/fnypcanzqhnNHXAWbWe5ktk3jy
   RMzPwPg1jjJYL2+pQgANvFc5OfCPc6NY+kpL9OxQWA0Zt95IQ96/2NueC
   ksCqFqwAhzLw6h+UCKPhrFeTKOmq9rJygykIQ7I1m7FQXwzc/7FOWYyWv
   foucIX+ZydsWPK+mJ1ajBNKXIwzTkwkBMkrlv4xrVsu9iWicQebGIjrJo
   O8Mu6cCEcqj3EY8aaf0oFbGDDOXbBtYxsn+JxnE0TvUsuQZEUXjuHZXz/
   FAvQEvAhiW/lclmQnsH8065byr/xZpXpEQlUl1u3vkgWbOXRN03hksFsJ
   Q==;
IronPort-SDR: RAcbIj8AgNfwgWnESOIzDLR23C2fnPVbi/fLcbsqfmriWVuQr6u2h4dyO0KVEnM9T043Nyj8sX
 KFcMzU7cpMSudF+oX3MVCSpCsMHHCNiGOmV6aGgihZ6tqtKqWvFEk9aPOMpV/2kJgU5hNNqztY
 6Ns26dFGYPV+Pnyy026zTbLytbXes6W+iLJuEKJoaDP/NQepwwpkTMHdAQLI/8IE2q6pRaFusv
 gGtSjgqL9Tx5sF2v47Dp4CIOqadP6ydF14oezJi8BhtBZRqPo+EM3ikVxiRCLpt7s46rP4T4iv
 Y8M=
X-IronPort-AV: E=Sophos;i="5.82,281,1613458800"; 
   d="scan'208";a="119335494"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 May 2021 08:27:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 7 May 2021 08:27:20 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 7 May 2021 08:27:16 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
	<soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>, "Eugen
 Hristev" <eugen.hristev@microchip.com>
Subject: [PATCH 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Fri, 7 May 2021 18:26:52 +0300
Message-ID: <20210507152655.182558-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Document the SAMA7G5 Evaluation Kit based on sama7g5 SoC.

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

