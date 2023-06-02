Return-Path: <SRS0=1ZhM=BW=foss.st.com=prvs=45170c5eae=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9F4C7EE29
	for <soc@archiver.kernel.org>; Fri,  2 Jun 2023 13:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0F1AC433A1; Fri,  2 Jun 2023 13:29:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 214C3C433D2;
	Fri,  2 Jun 2023 13:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 214C3C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352CEUrY023929;
	Fri, 2 Jun 2023 15:29:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=JXOkz1yMnYf3hSK6OQ9FOlo+6ogfqWnCLWQ9vPUkJP8=;
 b=nxrD9qk5R+hp5P1V1ITwxK4MnVOEvJxlkwhOL0tjIiZctfE/YbqgtpIGAuLRkcFNPw4+
 hxiHA8xabXvf54Q0icPv/MKWhCM8Abel9d24XwODbjHrO7/9gZH1dNGwj02yI530SjCD
 /mYIqsfnekos7vYpoGFIa3/IN3iRgXuPb09lLev21IjrZjLZaIbIM7KYv+MyDtAvp90n
 KxtyiZ89IrHPGasd6zk2AgOaDra6ao/nqAIz8VZo9+8lFFUy6PorP2QZGNUWon4jnJYf
 OhXAzZAtLmKTvyWDEIUDKQMmGMt1Ugt2i7YdKdz6ISLi2hlSWfBSaeiHcLLAVa+f2MuS qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qyc08a1uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 15:29:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1DA0100034;
	Fri,  2 Jun 2023 15:29:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D88E5236927;
	Fri,  2 Jun 2023 15:29:04 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 2 Jun
 2023 15:29:04 +0200
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
Subject: [PATCH v2 01/10] dt-bindings: pinctrl: stm32: support for stm32mp257 and additional packages
Date: Fri, 2 Jun 2023 15:28:50 +0200
Message-ID: <20230602132859.16442-2-alexandre.torgue@foss.st.com>
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

Add support for st,stm32mp257-pinctrl and st,stm32mp257-z-pinctrl.
Add packages AI, AK and AL (values : 0x100, 0x400 and 0x800)

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 1ab0f8dde477..2120ef71a78d 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -27,6 +27,8 @@ properties:
       - st,stm32mp135-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
+      - st,stm32mp257-pinctrl
+      - st,stm32mp257-z-pinctrl
 
   '#address-cells':
     const: 1
@@ -56,7 +58,7 @@ properties:
       Indicates the SOC package used.
       More details in include/dt-bindings/pinctrl/stm32-pinfunc.h
     $ref: /schemas/types.yaml#/definitions/uint32
-    enum: [1, 2, 4, 8]
+    enum: [0x1, 0x2, 0x4, 0x8, 0x100, 0x400, 0x800]
 
 patternProperties:
   '^gpio@[0-9a-f]*$':
diff --git a/include/dt-bindings/pinctrl/stm32-pinfunc.h b/include/dt-bindings/pinctrl/stm32-pinfunc.h
index e6fb8ada3f4d..28ad0235086a 100644
--- a/include/dt-bindings/pinctrl/stm32-pinfunc.h
+++ b/include/dt-bindings/pinctrl/stm32-pinfunc.h
@@ -37,6 +37,9 @@
 #define STM32MP_PKG_AB	0x2
 #define STM32MP_PKG_AC	0x4
 #define STM32MP_PKG_AD	0x8
+#define STM32MP_PKG_AI	0x100
+#define STM32MP_PKG_AK	0x400
+#define STM32MP_PKG_AL	0x800
 
 #endif /* _DT_BINDINGS_STM32_PINFUNC_H */
 
-- 
2.17.1

