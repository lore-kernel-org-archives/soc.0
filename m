Return-Path: <SRS0=yFtV=NH=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D51FC432BE
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 06:46:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4784661A59; Mon, 16 Aug 2021 06:46:50 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED15F61A51;
	Mon, 16 Aug 2021 06:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED15F61A51
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1629096409; x=1660632409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+TD5GOQnMaG8+zRlR+FFVFgYC3jWTUSdaYfkn7DGXIY=;
  b=KoFdO+3I4eIUcHQ4Y5SAk9v6W5I77BPtTJZ7CK0eQJ4m3nEmoZpbmyO9
   FfiaqB43xFLwxlXX9Mh2FcgNtxbedGXe2A7LuwatARrDnFV2g6w5bNyNr
   hh3pSH2dz7RnFSxvOqgw2IPhddXC9eMC3sEDxMbv+CQNv/xjV46pELtsL
   speEd7Eiy2OzjFQDvbjBFQyv03Jm1aL/ULKBpxDZ8a4jcziAndcHtEErr
   vfuirWPTfQ+D/r53F8bTj3AX6IcpolUpHdQVt7VG4NNJoum1cQHsTpsJS
   lHyzMHAEpmbRrpejXWD7GInw6GGlXL+IMzgpGpetYrGn/L5QoTYWdn7kX
   A==;
IronPort-SDR: 5f6qOo1GKNYNXOi1pEE4Slc6alSK18UNI+2BgdfvSSzbFgqt0sQfeMSOtqabHQyjT+ixUeKWA1
 D/TMYAVZwc0YTxNuVOUs9E54sB09sh0XOMx28GJHmoEikP2/RY8FYKU8yeh+oC/UGKLtVAXUWU
 4AZLJbCu5E1AFEBv8Ru713SwKBWe0z4agRDHBk5t6xVZ6g0j+r+QK7pHCIAmHdWERdAtDpsBqV
 cUV5YXXGpBSHe7tA8C82HWmmC2OgG/VkvKOZQFmjYhU5WdBzzvL8ojn+qKLhTEGAz5juTQakhG
 MO/xoWnTDoMhP5JKtBLbbtA6
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="125900554"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2021 23:46:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:47 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:43 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 6/7] dt-bindings: ARM: at91: document exegin q5xr5 board
Date: Mon, 16 Aug 2021 09:44:15 +0300
Message-ID: <20210816064416.1630674-7-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Document Exegin Q5xR5 board.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index a9ab18510fef..08efb259a947 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -132,6 +132,12 @@ properties:
           - const: atmel,at91sam9g20
           - const: atmel,at91sam9
 
+      - description: Exegin Q5xR5 board
+        items:
+          - const: exegin,q5xr5
+          - const: atmel,at91sam9g20
+          - const: atmel,at91sam9
+
       - items:
           - enum:
               - atmel,sama5d31
-- 
2.25.1

