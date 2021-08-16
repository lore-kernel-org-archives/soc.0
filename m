Return-Path: <SRS0=yFtV=NH=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E367C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 06:46:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0DB9861A51; Mon, 16 Aug 2021 06:46:34 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2AC761A54;
	Mon, 16 Aug 2021 06:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2AC761A54
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1629096394; x=1660632394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QOlG895YLHjDjZlX0+oU0a41P3tagn5ancDt1lnfWhE=;
  b=KGqDp88EC4Neq3wg21sGjGWclsyURFjY1eJ9QKP3JZNyDZQOBspVy8vA
   OhookoNoKPKzgTNT/KHFkcRfnwpiY2rth5v2Ga1cAUtREzwOJWAtdtHM5
   waIbaW8esczbYAxv471rPyA3jsJ0X7YJbnJXbjLmWqi+xLTF4oRwWgKIA
   iyTgYItyZdsSGfh1K1+k3Bh9mReSnkawoBlooxWeCZWcfkX3msgzy/cYL
   xmHUSvbeffm7zqEfsGGY2dt4fTprglN9vFcoDmvlnBCNMV+96xa5sFWmX
   MTJI84a3INUpHceO6upxbkZEbWJCrAa4kpixdbcz7/DiDQFsCkE7KCL5R
   Q==;
IronPort-SDR: BrheuwS149YsFwi3XG2K3Wr46ZPaN2CbmcFrIHSnFq4Cg5ZZt6l7M1HFzg0H/PmnTMvyoiSZGA
 OPrPwrbms5gf6EuYUc9GoN5wleO4tOakYz7cujvVW5f+Yah+gfTxdEk14/gdGKybdmgQPXaDSg
 /IogmZtWJleaOuP2XNw7CKXgeLugjvmKoLMtl3O8weON9RgpJ0JqCOSfdEBIxav0FDQOELvSVM
 7Z8lEgBVyi1yDPG2Q3IuYfbjz2ExZPwMbKoDV7nE8mj03FxGnGEysTaOOu4bku4q+heCavOiZu
 SCCRT7fsB0SXOmDFM8Q92Zkf
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="132362618"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2021 23:46:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:31 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:27 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/7] dt-bindings: add vendor prefix for calamp
Date: Mon, 16 Aug 2021 09:44:11 +0300
Message-ID: <20210816064416.1630674-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add vendor prefix for CalAmp Corp.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 07fb0d25fc15..8cf2ed41537a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -191,6 +191,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bticino,.*":
     description: Bticino International
+  "^calamp,.*":
+    description: CalAmp Corp.
   "^calaosystems,.*":
     description: CALAO Systems SAS
   "^calxeda,.*":
-- 
2.25.1

