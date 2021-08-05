Return-Path: <SRS0=YB89=M4=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930E7C4338F
	for <soc@archiver.kernel.org>; Thu,  5 Aug 2021 15:56:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78B6161131; Thu,  5 Aug 2021 15:56:57 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9C06112F;
	Thu,  5 Aug 2021 15:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B9C06112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628179016; x=1659715016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ba3PMiW36nZ+DW3AnbgSVLgStmXrbfUqHhLyUQwshzg=;
  b=pupGa8/XUcj02aFqAYUNHPFdTNdZfqFw2pd1Q0yJRUYeKfgKCaiFghsz
   y/Q1VFcirT+3adfGadaVTGrHesy2BZ4gnDtCEfu950Gnvhby6s/9lu20o
   hCCsk0gcCHsOBNq9jYVq192+mX+LnWBDCOoOyH1g2VdTIXt9vvZGy9iIK
   IVjlaLWAErUqy/TJ+ei3l4XaTA12lQ4h0V8Wb2tfWSGrkmJfyLhLUJrqq
   gDy6ZuIu9TUOLt6sIRD6waO4LCJYF/dhKK53S/7mCgrCOAOtNy7INifDP
   Sw9+3eiJ6sXeoyj8sB9+S7NN2UU5KywQnvOV516laBcO+ZawS9RVAYQtl
   A==;
IronPort-SDR: smDePm7d2kBBMXYpxVzF4KURZX+MRqBWV9nvdX7urDDOe1i9XVGnpG5DETiyH4tNGQwStfeTdJ
 2iuGCVs1A0Bwjoq8xcusoA04aGQlTz/H81icsuECqVqiA6W1eZjFn3sDfy6VkYqLo2Lz8Vt+Bv
 j/ZtVjEZ0B4A11Vg7aDH/SGboGbnFQ0bH8HCsDa+5zFUx9Alnm19Kb9b+cCrgUh1An92Y3IsLq
 E6bBOY9wyzc4q5Vghd1OCV0U1638QVwIaIPAYu6s3wgSopk5jkVhpmII/VqDVOP5bX5tr5t/ZD
 1z06RoOqasVl/MHEsS/0NE3N
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="124734202"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2021 08:56:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:56:54 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:56:32 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 3/7] dt-bindings: ARM: at91: document exegin q5xr5 board
Date: Thu, 5 Aug 2021 18:53:53 +0300
Message-ID: <20210805155357.594414-4-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Document Exegin Q5xR5 board.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index fba071b9af1d..a9ab18510fef 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -126,6 +126,12 @@ properties:
           - const: atmel,sama5d3
           - const: atmel,sama5
 
+      - description: CalAmp LMU5000 board
+        items:
+          - const: calamp,lmu5000
+          - const: atmel,at91sam9g20
+          - const: atmel,at91sam9
+
       - items:
           - enum:
               - atmel,sama5d31
-- 
2.25.1

