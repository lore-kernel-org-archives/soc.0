Return-Path: <SRS0=oo5W=OF=foss.st.com=prvs=79166e676a=alexandre.torgue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6F0C3271E
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 13:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5765BC32781; Fri,  5 Jul 2024 13:46:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4CD0C116B1;
	Fri,  5 Jul 2024 13:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4CD0C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4658qS6K018156;
	Fri, 5 Jul 2024 15:46:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=f85XnVJfjAkjzN/V4PYLWk
	IEnaGKGWfsJCT2tr+vvSw=; b=42X9hf43HFq2vUxTBiFDKxocQukJhNloFMkWb6
	5zZtbDlaQH1ASAXpbfxhExVTUUCzznLvOPZM5y+95Zo2SDBoT6fSqof9nRdN9Zcf
	7P4WJ0NUmvwf2FXc4dvrEscckRAXgIBzX8I/P6E4l2IqLcqkszWulYex55Uil8GL
	M4z0uHw/wzmrMHkUxEt0FvqVCI4wKc0om04cfwlHvjfbw64jqv9EVh+K8EJ2QgzL
	HiOud/9s9opEZ+J48BY1viuEsx2GBwMwcASap20831H459mC763HsoGg0gFjQeBi
	S2GMhMsZimiom65rkF92E1/RPovdPredMJB7UI/qi9cRmvPg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40295dsh2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 15:46:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2347740046;
	Fri,  5 Jul 2024 15:46:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AC0E2291B1;
	Fri,  5 Jul 2024 15:45:55 +0200 (CEST)
Received: from localhost (10.48.86.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 5 Jul
 2024 15:45:55 +0200
From: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin
 Hilman <khilman@baylibre.com>, <soc@kernel.org>,
        <arm@kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] arm64: stm32: enable scmi regulator for stm32
Date: Fri, 5 Jul 2024 15:45:54 +0200
Message-ID: <20240705134554.2833835-1-alexandre.torgue@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_09,2024-07-05_01,2024-05-17_01

From: Pascal Paillet <p.paillet@foss.st.com>

Add SCMI ARM REGULATOR configuration for stm32.

Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Hi ARM SoC maintainers,

Please consider this first round of STM32 SoC for v6.11 cycle. 

Thanks
Alex


diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a52618073de2..3738a9fc2d6c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -312,6 +312,8 @@ config ARCH_STM32
 	select STM32_EXTI
 	select ARM_SMC_MBOX
 	select ARM_SCMI_PROTOCOL
+	select REGULATOR
+	select REGULATOR_ARM_SCMI
 	select COMMON_CLK_SCMI
 	select STM32_FIREWALL
 	help
-- 
2.34.1

