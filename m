Return-Path: <SRS0=YMvz=LW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DA5C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jun 2021 12:07:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF2DD61C72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jun 2021 12:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF2DD61C72
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZS5i6D/TmJFdwKPQwYZ/C3EhfB6l02PgMBPYNUMygGc=; b=oCgMJs+aG5Co9O
	4NXtd33lHZIEFCkcrXCIBteFIQvFARnZfhkjVmZ5MazqYilWIF8SFZu3cKC0vuPZ9qgyiQoCY7thN
	pIsvhu/QgTly7sZejsryAGZOeBtjWo1SVDBOozaBwQUWMQao0YAjrOIeUWNo7Ale0bmtqkhcXBweY
	6KBgL99oOBauL+98ra0CakYZya2X5ehAGTqcKRmIteFNFP8u5VJEcmJYcDaA6pY3iVZPF78cHQqJ3
	DkIQxwImyorzJbUS68ZkVl31O1DgwSEemltLxHjJBpPV1z4kZon5RBJaNH3PGH4XDne0rquJAUW+m
	OBdFLs/yGDQLZLg+txVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxq0u-007rIC-79; Mon, 28 Jun 2021 12:05:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxq0q-007rHi-ST
 for linux-arm-kernel@lists.infradead.org; Mon, 28 Jun 2021 12:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624881916; x=1656417916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D1JleMTnSO1ymCUdXh/+hDEDMbLr8UzAtT0hHDbs/TM=;
 b=ZJ6Os/bUn7Z4tajL1Ma9md2py+wKi3Yc2ceyoxIDsyibtHh4zaWdUQJX
 fBl3ujjFeq0T1OFAp9dRKqjLRiArJF1vDRWkYO06DXIu+grkJiNIsE9Im
 TLj3XEZY76uXr0Ip97965Sz+xi/WGb8qu2xzlKN2NOnD6ot/+uLhygHwR
 H+7v6SjfZc5bSrW73vH/9PyjH9PQ1ee2WKGPEGcBqv8t2Z+WqAi3RC4+S
 OSURo89MJd41HIjf2QgT2W4X6rd3CKmzvkyxykg0nbhr2y/g5EzqPomCH
 u4Us3P/1LTDh/eyuQcx0H33phRVdbIbyQfqRnb/n7I979EWLwVQD3g8QU w==;
IronPort-SDR: uwNKe2ztjzkSoZGpMhZPcQBzKONsvPI90wvwmw83jXzu6M4nMLglu7agH0C9ywbvwzXPyenmqn
 jaAJDFCBZXLTazW1z4CaUNSnTS9mc17nEmgYkjq4GhCOGI4A0ld6xftoTTomhKb7Yr76eW1yqO
 DMCPDQORGogJG0SVGNDwIDPQu2RP/GuF+we9bFiaFMtNEFSL4Qnxp44ez8o0ML8xcBYM4kph2s
 QBxxDohXTRE1jZjiwkNDFc1VF/Xi+uklkp56P2AFv2IfVIz6T5uVadpo7PsSm12dZfsCDFB+w7
 ZqA=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="120256120"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2021 05:05:13 -0700
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_050517_046440_4693633A 
X-CRM114-Status: UNSURE (   6.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210628120449.EMfxmU1__JDyf5NgR3imISoEQIifMcexh4qf6z3Lw3I@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
