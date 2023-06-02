Return-Path: <SRS0=1ZhM=BW=foss.st.com=prvs=45170c5eae=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE90C7EE2E
	for <soc@archiver.kernel.org>; Fri,  2 Jun 2023 13:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0E54C433A4; Fri,  2 Jun 2023 13:30:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 787B7C433D2;
	Fri,  2 Jun 2023 13:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 787B7C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352CPh86004909;
	Fri, 2 Jun 2023 15:30:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=2GzwoxYEjBT0JhugYezi2XGAktvGSWYGvh5MOPi4uiM=;
 b=1t7tUoPhodc9wAxJcRSzW/le1XLeRT9bosK7fJDy5mJb0MXGIFTG8A+Z7aSs0GmmJits
 nS9I71iJxd8HTrd0IkfM/YKxlnMBxGjH6uhfVkTJfq9uPxyvZLesmEHabOxsP5qabi8E
 a9+jUGgFOu2sGitLsQoISuNTkzHdYIwoXV7OtpKAgvqhqUnXM+UOPTxSo2h8z+2LzWFb
 k3xunm11OP4GCAeUOJJJRcQd0zOS8MHNtp/Ene2u7J2vzD2HOyiGldSjxz0+eTRNAF3z
 4m/wYbl5TTtHp6+n7GlPSPVFrpp5NtiBU/XdyQ8Os3ZwtddXeCc1TCwvzYf8GOMGJ4HF Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qyc51a0aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 15:30:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE591100034;
	Fri,  2 Jun 2023 15:30:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B5FE923694A;
	Fri,  2 Jun 2023 15:30:10 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 2 Jun
 2023 15:30:10 +0200
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
Subject: [PATCH v2 07/10] dt-bindings: stm32: document stm32mp257f-ev1 board
Date: Fri, 2 Jun 2023 15:28:56 +0200
Message-ID: <20230602132859.16442-8-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_10,2023-06-02_02,2023-05-22_02

Add new entry for stm32mp257f-ev1 board.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 4af5b8f4f803..4466b455bffa 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -161,6 +161,12 @@ properties:
           - const: phytec,phycore-stm32mp157c-som
           - const: st,stm32mp157
 
+      - description: ST STM32MP257 based Boards
+        items:
+          - enum:
+              - st,stm32mp257f-ev1
+          - const: st,stm32mp257
+
 additionalProperties: true
 
 ...
-- 
2.17.1

