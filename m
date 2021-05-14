Return-Path: <SRS0=B9yD=KJ=microchip.com=Eugen.Hristev@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D9EC433B4
	for <soc@archiver.kernel.org>; Fri, 14 May 2021 08:22:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D210261458; Fri, 14 May 2021 08:22:48 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676F261408;
	Fri, 14 May 2021 08:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 676F261408
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=Eugen.Hristev@microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1620980568; x=1652516568;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D1JleMTnSO1ymCUdXh/+hDEDMbLr8UzAtT0hHDbs/TM=;
  b=XpnoxZR+rdJBTDQI/sPZywm0eTXiA/uOfV/Xxq0DI8ScrZqAj2KhA687
   QYnEml7rL1RRDdx4K9B6OVmyozUAmBlbv+VPuPVPtLT18tjbIULTBwydF
   EM3VPV4EuWgBWOIHp4i1GV0YpzS3VjLWGKrhrcQv3860bkyVIbcel3eT4
   hVTTGq0uk49f1a8chN3fiaKUt2qV3vsmxzZskZpJLJuK8vRxJJ+hKRF/c
   SLUhp+TW9wbj6PbzsxZqSOhaSE0y/gqkz1gW7rwNSUsfIbZWZEKK0Ystx
   vHC0rMj+8FqTEnW3UBm60vSjEyBNKyLdOivbnLFaIKUMsjhsZpGv4YjZa
   A==;
IronPort-SDR: vrn929UhSWLJK1sTs+1BY/s6IU0eQoyieGhDAPPIHf6Oc/AhXwRQDTyHZBy+Sr2QJTBXv3OP9h
 n3LPeiSYUglTw6SUUss9DGU4f25DwZ8l0+NlvobTtnWOQ05hPv1D+upBO8GVFzNJ6JIIwy6ul1
 4bUW94fksKKoMQc15Ko36ANlVDQuqmWpR5tzySYiPIY60HeM9A/lO77OxLPwapoHyyAYub5kv5
 tVhEJVAC3D2wLO9jTnYCkaCVSumfMtSjw3cAG/waJmChOShLpW5Y3aORd49sjnsCBQvms2f+/9
 Cbw=
X-IronPort-AV: E=Sophos;i="5.82,299,1613458800"; 
   d="scan'208";a="128041994"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2021 01:22:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 01:22:47 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 14 May 2021 01:22:44 -0700
From: Eugen Hristev <eugen.hristev@microchip.com>
To: <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
	<soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<claudiu.beznea@microchip.com>, <codrin.ciubotariu@microchip.com>,
	<tudor.ambarus@microchip.com>, Eugen Hristev <eugen.hristev@microchip.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: ARM: at91: document sama7g5ek board
Date: Fri, 14 May 2021 11:21:48 +0300
Message-ID: <20210514082151.178571-1-eugen.hristev@microchip.com>
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

