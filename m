Return-Path: <SRS0=YB89=M4=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB03C4338F
	for <soc@archiver.kernel.org>; Thu,  5 Aug 2021 15:57:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3B6BE61131; Thu,  5 Aug 2021 15:57:28 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 008AE6105A;
	Thu,  5 Aug 2021 15:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 008AE6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628179048; x=1659715048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F3gj+l86LGzCXpPdm2bvQS8DTJlfMc1PnzmCTCU9NWo=;
  b=PSpnn/1q6NC49YTSRzJ7gP2br4uK3x39oIl1L0xqW7kDT3Y6gINm2YUm
   zWzn10RhOLkycRa7T+VpNgS/3y97jccUE6keRS7dVTbNRQVbb1dGA/r1z
   2vy6iAO+k0QKK2WnEv/qQSlsBwrmvLx6LnWnPOF1+SMXmbTeanWQ/JooJ
   fuygXgJlLyIK9UyEflknaPTVBHTAGC4YHFj1wk8G8BUMfi8LENNhZgrrl
   gCp1cCJM8VonYhJft2SrHoKVl5D60Mna/7D+zmF2MDkpoAb7y70lz7PEw
   qXyxNKo73PUoqfPolH7JshS5nb1k0X38BjeU6Y63UTV3Rct3qWCORjKz+
   g==;
IronPort-SDR: n9rnYFlLL/iZ26UuOJnityprQY8Q3eO5jiRPszsRFXa8rF8xdOo4VYceE1Kr3wMyiGyUFgcMT2
 LusXKlf12QL9bacp7DRyGa4OfvKcTsjrvaI7QTMX6u0QWgJn9FeP4iIDvV41bYF6SE1H0bj927
 3DVeMtDX3rgIEMZKhVtWXeB2GmfhZ8bBBI3iE9FFy/Jg8G0779oTSh2MNut0WZXaxx15h8lian
 CAjPHUEGErGzfcD5E0qhGrm9GzGB6X1QLabMtrtIgsvuoOzrScxdiH376G1/M+eLYcH77PJP/p
 LcCKemC0ptp/Z3vspL1QkTK5
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="131188582"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2021 08:57:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:57:26 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:57:04 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 5/7] dt-bindings: add vendor prefix for calamp
Date: Thu, 5 Aug 2021 18:53:55 +0300
Message-ID: <20210805155357.594414-6-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805155357.594414-1-claudiu.beznea@microchip.com>
References: <20210805155357.594414-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add vendor prefix for CalAmp Corp.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2fa00c7b7ee2..61fe4778498d 100644
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

