Return-Path: <SRS0=FmVO=BS=foss.st.com=prvs=4513b8c82e=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70C2C7EE2F
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 16:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD359C433EF; Mon, 29 May 2023 16:22:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7474DC4339E;
	Mon, 29 May 2023 16:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7474DC4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34TBP6Wa020334;
	Mon, 29 May 2023 18:22:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=enYQhtNXlOPwr35FdG0yc+1kkyx25zReesmd4En5xHA=;
 b=YLUfMCjtqCildJpXEm55Fjyoq7X5/XRQv8eYDHI8mPctsJ6vLEvRhvqf4CNZwP431pFQ
 2qegsGp/6UWyTTLgtO0907MmSzk/OV4J+zg1MLMqHOZNIE8lC6YX6xoZ88kxP9AOrb6M
 sRDHncIyHeMj4ymJi519ZJXpcakBa4fwW0CCHgf5nSP+2LzV+cESydrf1wv+lFl5OeTZ
 DdptucxXD639FgQ08kIE8i6yrmHUmFlLfqyZivKjlKGM3Mr06LH4zTWvzteouwvsZjNN
 T+TzUH81+nUSp/5KQzrGY4El+3zaN2vB6RN+SElALpp0HQ3uERdu9PjqsqF9VS7Dm0uM MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quakpaup5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 May 2023 18:22:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 413CF100039;
	Mon, 29 May 2023 18:22:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B5E7233C95;
	Mon, 29 May 2023 18:21:46 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 18:21:45 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH 08/11] dt-bindings: stm32: document stm32mp257f-ev1 board
Date: Mon, 29 May 2023 18:20:31 +0200
Message-ID: <20230529162034.20481-9-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_10,2023-05-29_01,2023-05-22_02

Add new entry for stm32mp257f-ev1 board.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 7d7ca33d2e61..e5b929a52646 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -167,7 +167,10 @@ properties:
           - const: st,stm32mp253
       - items:
           - const: st,stm32mp255
-      - items:
+      - description: ST STM32MP257 based Boards
+        items:
+          - enum:
+              - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
 additionalProperties: true
-- 
2.17.1

