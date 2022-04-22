Return-Path: <SRS0=RS4j=VA=foss.st.com=prvs=01113bea48=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD92C433F5
	for <soc@archiver.kernel.org>; Fri, 22 Apr 2022 15:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B489C385AE; Fri, 22 Apr 2022 15:10:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EAE39C385A4;
	Fri, 22 Apr 2022 15:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EAE39C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23MAS3Wh031297;
	Fri, 22 Apr 2022 17:09:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=DHH6kmmWbKU7+JXphSa9PFuvbxZEO9J4ngGZimOqlQ0=;
 b=IDVtFdT9curyvkHNImRJyzoe7ISJoz8Ei/CRJ4/xkXqr7zGsC+WIT1ndordDkYYrF3tF
 HAVFdSV2FNug7cB5EwgCvJpoLMt22fGKqM4xPQ6M4dBsXYMN5rOgsKrwWqcLeghAvIRV
 f3vWD2PbYFTlv97E7x9pQrOklamqm7C4OBe/v1K9lwOvb5M6PW5c6cGChQSPIh6aN+g+
 mqqm+kJQg4A3QqR3FWCZiNRdfm6tLGm3SZS84oKkuH1UO30kC+7ers1K9QU1suw+wuac
 wrJEvCWj9Qhebz2td9fCN25Bf4Q7hST1p0M2mgiDh6c083S2Ma0vNkbOq0juUaSPqIbD nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqe9v5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Apr 2022 17:09:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42C9E100034;
	Fri, 22 Apr 2022 17:09:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A054233C62;
	Fri, 22 Apr 2022 17:09:55 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 17:09:54 +0200
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
Subject: [PATCH 1/8] dt-bindings: rcc: Add optional external ethernet RX clock properties
Date: Fri, 22 Apr 2022 17:09:45 +0200
Message-ID: <20220422150952.20587-2-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_04,2022-04-22_01,2022-02-23_01

From: Marek Vasut <marex@denx.de>

Describe optional external ethernet RX clock in the DT binding
to fix dtbs_check warnings like:

arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dt.yaml: rcc@50000000: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>
To: devicetree@vger.kernel.org
Acked-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index a0ae4867ed27..7a251264582d 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -59,6 +59,14 @@ properties:
           - st,stm32mp1-rcc
       - const: syscon
 
+  clocks:
+    description:
+      Specifies the external RX clock for ethernet MAC.
+    maxItems: 1
+
+  clock-names:
+    const: ETH_RX_CLK/ETH_REF_CLK
+
   reg:
     maxItems: 1
 
-- 
2.17.1

