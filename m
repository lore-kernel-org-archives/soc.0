Return-Path: <SRS0=FmVO=BS=foss.st.com=prvs=4513b8c82e=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B71C7EE2C
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 16:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94767C4339E; Mon, 29 May 2023 16:20:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 177B9C433D2;
	Mon, 29 May 2023 16:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 177B9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34TBP8Ml002485;
	Mon, 29 May 2023 18:20:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=INrrxQJg6TTyVqmhAnga0K1bHfzGHyavs59YzoW81cw=;
 b=VtihfGKkJei6wJHdrYwlnzSgSpjJV+nlsgIWEGLFAm/LUdm2WPLJJZ1iv/KlY6YASUzp
 KDGAGcBeoA1CVfi8FhFpGQe1FodEYesMZ8noIpmWMZXDLvl2blWkOVIaj9a6EmosYCtw
 4aiykFjU6ieNlkhaY70FtDpiUsRCXm/KlS3ZClPFz1IxRxdo8FXlq0eQnTF5B8xXWDDD
 cWVgVcJeQkGzE3t+CWTo5pRdGfPbPPcUNPWVv/uk5n+WyCPCoZSBfJ7chRbrpcqcI8Ba
 h21RalEWIztxxGNl6v8k4xIuRKrSSicvQAenkR5x7wk57uIO5RyP1a3LjJaxAhS1aiwr Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quag2anwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 May 2023 18:20:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70A2B100034;
	Mon, 29 May 2023 18:20:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68DB6233C87;
	Mon, 29 May 2023 18:20:43 +0200 (CEST)
Received: from localhost (10.201.21.93) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 29 May
 2023 18:20:43 +0200
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
Subject: [PATCH 03/11] dt-bindings: stm32: add st,stm32mp25-syscfg compatible for syscon
Date: Mon, 29 May 2023 18:20:26 +0200
Message-ID: <20230529162034.20481-4-alexandre.torgue@foss.st.com>
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Add the new syscon compatible for STM32MP25 syscfg = "st,stm32mp25-syscfg".

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index ad8e51aa01b0..9ed5b121cea9 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -16,6 +16,7 @@ properties:
       - items:
           - enum:
               - st,stm32mp157-syscfg
+              - st,stm32mp25-syscfg
               - st,stm32mp151-pwr-mcu
               - st,stm32-syscfg
               - st,stm32-power-config
-- 
2.17.1

