Return-Path: <SRS0=TLCG=VT=foss.st.com=prvs=11307c6b18=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5FAC433F5
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 09:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E119C340EC; Wed, 11 May 2022 09:26:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22CE2C340EB;
	Wed, 11 May 2022 09:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22CE2C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B6m0D8032615;
	Wed, 11 May 2022 11:26:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=dUzfifmeVPVD1lvQo2dNl4VHAKYzlZjFPmBRoR9JO8M=;
 b=TRSERlnnjo9bxuCTZH1XcYEhr+sl/payA+6t6+9BZ+uh3U4LMq0HYqOMxp5lgME588wG
 RAEnwYLNsGIcNqjXiJilyoA4zPq1+l9eHncv3LvMB9zh3sYJl6gRpJJd5ZPc1Mo58E1Q
 Y8IEGi4nMGVluOsPPpJg5DR3Oli62vbQWAG1YlfD87iZI2/XzknNFxVRgrXB1wZJta53
 CBcdqqx8BIRIcQEGdgkVgJMqF/kNFAVIJnva21zIjFZQofJXigaxQbxN8UsLUVOp7INV
 rjJyya5uEFm8ene+PV/uAd0X2LC9X4NlPgfq9I3/6bcFA36seAga9xTp2PioJBlJZ9wP Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwg415w95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 May 2022 11:26:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B15D8100034;
	Wed, 11 May 2022 11:26:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93FD6216ED1;
	Wed, 11 May 2022 11:26:00 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 11 May
 2022 11:26:00 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-arm-kernel@lists.infradead.org>, <robh@kernel.org>
Subject: [PATCH] dt-bindings: clock: stm32mp1: adapt example for "st,stm32mp1-rcc-secure"
Date: Wed, 11 May 2022 11:25:59 +0200
Message-ID: <20220511092559.4952-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_03,2022-05-10_01,2022-02-23_01

For "st,stm32mp1-rcc-secure" schema, clocks and clock-names entries are now
required properties.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Acked-by: Rob Herring <robh@kernel.org>

---

Hi ARM SoC Maintainers,

Can you consider this patch as a second round of STM32 DT updates for v5.19. It
fixes a build issue for stm32mp1-rcc expample yaml introduced in the first round.

Thanks
Alex

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
index bb0e0b92e907..45b94124366c 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
@@ -106,10 +106,17 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
     rcc: rcc@50000000 {
         compatible = "st,stm32mp1-rcc-secure", "syscon";
         reg = <0x50000000 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
+        clock-names = "hse", "hsi", "csi", "lse", "lsi";
+        clocks = <&scmi_clk CK_SCMI_HSE>,
+                 <&scmi_clk CK_SCMI_HSI>,
+                 <&scmi_clk CK_SCMI_CSI>,
+                 <&scmi_clk CK_SCMI_LSE>,
+                 <&scmi_clk CK_SCMI_LSI>;
     };
 ...
-- 
2.17.1

