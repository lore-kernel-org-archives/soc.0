Return-Path: <SRS0=RS4j=VA=foss.st.com=prvs=01113bea48=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C50C43217
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 15:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DABBC385AB; Fri, 22 Apr 2022 15:10:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EB141C385A8;
	Fri, 22 Apr 2022 15:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EB141C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23MEYpBf004664;
	Fri, 22 Apr 2022 17:09:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=woZ58dxJuQ0iY6HX7qWewtoszaIe7hcsPEtRaLww4Ew=;
 b=Jw/nj+nNe128iHIBmznWCB+qMFrcWGndUZdv+4CESixDbY9YcVxahyCYJ0OYeUclq4ut
 xVW43lrH0T8kiUlbCD+xLGkeO8bEg7H0PFlmyxJVeHwf9KzxZ8keabdPWFQ72FxG4WXT
 pfCTSXlw21tBKFVcJSsJdQX32uvrrLbe9v1g1a0ix1BGxtiyj5o29FcAd31HLv3Onz37
 tjtGTjtril1ljEc+2VfUJguNgxwelJof0XGpdDMWoFcN1xeyb4oG5OSKTYHJNiosBSZm
 KZpNlVuFG0mw7PXS5ROku3dtvlUXDeTPZfn1YHwyJo9f4P9eLc4YYC8wbQABle1T8Tsb LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe9v5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Apr 2022 17:09:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C61B110002A;
	Fri, 22 Apr 2022 17:09:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEDE3233C62;
	Fri, 22 Apr 2022 17:09:55 +0200 (CEST)
Received: from localhost (10.75.127.51) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 17:09:55 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>, <soc@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>, <etienne.carriere@st.com>
Subject: [PATCH 2/8] dt-bindings: clock: stm32mp1: describes clocks if "st,stm32mp1-rcc-secure"
Date: Fri, 22 Apr 2022 17:09:46 +0200
Message-ID: <20220422150952.20587-3-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_04,2022-04-22_01,2022-02-23_01

In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
security support hardened), "clocks" and "clock-names" describe oscillators
and are required.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index 7a251264582d..bb0e0b92e907 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -58,14 +58,8 @@ properties:
           - st,stm32mp1-rcc-secure
           - st,stm32mp1-rcc
       - const: syscon
-
-  clocks:
-    description:
-      Specifies the external RX clock for ethernet MAC.
-    maxItems: 1
-
-  clock-names:
-    const: ETH_RX_CLK/ETH_REF_CLK
+  clocks: true
+  clock-names: true
 
   reg:
     maxItems: 1
@@ -76,6 +70,38 @@ required:
   - compatible
   - reg
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - st,stm32mp1-rcc-secure
+then:
+  properties:
+    clocks:
+      description: Specifies oscillators.
+      maxItems: 5
+
+    clock-names:
+      items:
+        - const: hse
+        - const: hsi
+        - const: csi
+        - const: lse
+        - const: lsi
+  required:
+    - clocks
+    - clock-names
+else:
+  properties:
+    clocks:
+      description:
+        Specifies the external RX clock for ethernet MAC.
+      maxItems: 1
+
+    clock-names:
+      const: ETH_RX_CLK/ETH_REF_CLK
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

