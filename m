Return-Path: <SRS0=yFtV=NH=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF760C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 06:46:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 967E061A6F; Mon, 16 Aug 2021 06:46:45 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 555D161A51;
	Mon, 16 Aug 2021 06:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 555D161A51
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1629096405; x=1660632405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Z3xraYJn7692GEB/jLqBPc8LmMxKZXlwCBT3w0+7ps=;
  b=2Ct7RYUiBCYZcRLaPPQqxh99Yr5sBZRHCZufC3aZ6BWgm2DjmnlEMM80
   E+UNZg6DuxXqTbsb9UtF4zziWcMW6GxjxtZEqG7DGorrpocQCL3Yr9caB
   J5XpGH+7hSdYdAfE0++7ADBdAdSXggks0eB70pqVIPhx0tN4Vx6BLem1i
   oEmos+6ryOjT343ESS3DC9ThFNzOnTsdpiAaHJmYuDN5tPZHPwm20tuAR
   uq1wYL5MsPoa7+tk3BOVlTSzZQouesRrnZSEe4At/4CsC08Ld7w4E/nAf
   xJTtutvWnHf2nxCC1hZGK7s6o7sSYUoRnothSYkedbZ6ppkVbms+8dZUZ
   A==;
IronPort-SDR: zf9DVFLod6Y7SAxc450FpmHIpB25uulwjCARvsisoyxU1x0yJRqdW1pgSSTdFmXYF5NwiMzqx7
 77gjFjqn3WhOg7CwdRjFUY/qCW9C/iXv9xq7pVBXSPYvTIouOTgktonCt0Yne5y4YtoFNwENMB
 fEn4QKhxXBEszjKae0EdA0t00EuCjPG9qdO+LMgF9z7KKdzEK/PktDLi25HFQTdnQw3s5EOwK6
 YF7SVCwpRXRnc36GL6xlXo6abnoCsfsUIFiMk+hW2MM+o+0nVBN6SuMAjbKYU+qu4vE6wmH+2r
 lrKetvvnNGqjXJdTnY+dtQQs
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="125900538"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2021 23:46:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:42 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:38 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 5/7] dt-bindings: add vendor prefix for exegin
Date: Mon, 16 Aug 2021 09:44:14 +0300
Message-ID: <20210816064416.1630674-6-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
References: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add vendor prefix for Exegin Technologies Limited.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 8cf2ed41537a..61fe4778498d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -393,6 +393,8 @@ patternProperties:
     description: Exar Corporation
   "^excito,.*":
     description: Excito
+  "^exegin,.*":
+    description: Exegin Technologies Limited
   "^ezchip,.*":
     description: EZchip Semiconductor
   "^facebook,.*":
-- 
2.25.1

